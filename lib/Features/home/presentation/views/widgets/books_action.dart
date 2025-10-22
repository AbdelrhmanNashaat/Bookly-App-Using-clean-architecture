import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../core/widgets/custom_button.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.price, required this.bookLink});

  final double price;
  final String bookLink;

  @override
  Widget build(BuildContext context) {
    final bool isFree = price == 0;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: CustomButton(
        text: isFree ? 'Free Preview' : 'Buy for ${price.toStringAsFixed(2)}€',
        backgroundColor: isFree ? const Color(0xffEF8262) : Colors.white,
        textColor: isFree ? Colors.white : Colors.black,
        borderRadius: BorderRadius.circular(16),
        fontSize: 16,
        onPressed: () => _launchUrl(bookLink, context),
      ),
    );
  }

  Future<void> _launchUrl(String link, BuildContext context) async {
    if (link.isEmpty) {
      log('Empty link');
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('No link available')));
      return;
    }

    log('link: $link');
    String fixedLink = link.trim();

    // Always use HTTPS if possible
    if (!fixedLink.startsWith('http://') && !fixedLink.startsWith('https://')) {
      fixedLink = 'https://$fixedLink';
    } else if (fixedLink.startsWith('http://')) {
      fixedLink = fixedLink.replaceFirst('http://', 'https://');
    }

    final Uri url = Uri.parse(fixedLink);

    try {
      // Prefer external browser if WebView fails
      bool launched = await launchUrl(
        url,
        mode: LaunchMode.inAppWebView,
        webViewConfiguration: const WebViewConfiguration(
          enableJavaScript: true,
        ),
      );

      if (!launched) {
        launched = await launchUrl(url, mode: LaunchMode.externalApplication);
      }

      if (!launched) {
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Could not open the link: $fixedLink')),
        );
      }
    } catch (e) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Failed to open link: $e')));
    }
  }
}
