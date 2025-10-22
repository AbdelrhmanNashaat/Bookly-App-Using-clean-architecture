import 'package:bookly_app_clean_architecture/Features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/book_entity.dart';
import 'custom_book_item.dart';

class SimilarBooksListView extends StatefulWidget {
  const SimilarBooksListView({super.key, required this.books});
  final List<BookEntity> books;

  @override
  State<SimilarBooksListView> createState() => _SimilarBooksListViewState();
}

class _SimilarBooksListViewState extends State<SimilarBooksListView> {
  bool isLoading = false;
  late ScrollController _scrollController;
  var nextPage = 1;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() async {
    var currentScrollPosition = _scrollController.position.pixels;
    var maxScrollExtent = _scrollController.position.maxScrollExtent;
    if (currentScrollPosition >= 0.7 * maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<SimilarBooksCubit>(
          context,
        ).fetchSimilarBooks(pageNumber: nextPage++);
        isLoading = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .15,
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: widget.books.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: CustomBookImage(
              imageUrl: widget.books[index].imagePath ?? '',
            ),
          );
        },
      ),
    );
  }
}
