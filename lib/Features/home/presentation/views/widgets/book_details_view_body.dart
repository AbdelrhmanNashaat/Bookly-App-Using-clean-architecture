import 'package:bookly_app_clean_architecture/Features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/functions/service_locator.dart';
import '../../../data/repos/home_repo_impl.dart';
import '../../../domain/entities/book_entity.dart';
import '../../../domain/use_cases/fetch_similar_books_use_case.dart';
import 'books_details_section.dart';
import 'custom_book_details_app_bar.dart';
import 'similar_books_section.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.book});
  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                CustomBookDetailsAppBar(),
                BookDetailsSection(book: book),
                Expanded(child: SizedBox(height: 50)),
                BlocProvider<SimilarBooksCubit>(
                  create: (context) => SimilarBooksCubit(
                    fetchSimilarBooksUseCase: FetchSimilarBooksUseCase(
                      homeRepo: getIt.get<HomeRepoImpl>(),
                    ),
                  )..fetchSimilarBooks(),
                  child: SimilarBooksSection(),
                ),
                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
