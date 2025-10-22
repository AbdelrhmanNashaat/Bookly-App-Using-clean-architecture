import 'package:flutter/material.dart';
import '../../../../../core/widgets/custom_button.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.price});
  final double price;

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
        onPressed: () {},
      ),
    );
  }
}
