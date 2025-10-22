import 'package:bookly_app_clean_architecture/Features/home/domain/use_cases/fetch_similar_books_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  final FetchSimilarBooksUseCase fetchSimilarBooksUseCase;
  SimilarBooksCubit({required this.fetchSimilarBooksUseCase})
    : super(SimilarBooksInitial());

  Future<void> fetchSimilarBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(SimilarBooksLoading());
    } else {
      emit(SimilarBooksPaginationLoading());
    }
    final result = await fetchSimilarBooksUseCase.execute(pageNumber);
    result.fold((failure) {
      if (pageNumber == 0) {
        emit(SimilarBooksFailure(errorMessage: failure.errorMessage));
      } else {
        emit(SimilarBooksPaginationFailure(errorMessage: failure.errorMessage));
      }
    }, (books) => emit(SimilarBooksSuccess(books: books)));
  }
}
