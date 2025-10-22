import 'package:bookly_app_clean_architecture/Features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  final FetchFeaturedBooksUseCase fetchFeaturedBooksUseCase;
  FeaturedBooksCubit({required this.fetchFeaturedBooksUseCase})
    : super(FeaturedBooksInitial());
  Future<void> fetchFeaturedBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(FeaturedBooksLoading());
    } else {
      emit(FeaturedBooksPaginationLoading());
    }
    final result = await fetchFeaturedBooksUseCase.execute(pageNumber);
    result.fold(
      (failure) {
        if (pageNumber == 0) {
          emit(FeaturedBooksFailure(failure.errorMessage));
        } else {
          emit(
            FeaturedBooksPaginationFailure(errorMessage: failure.errorMessage),
          );
        }
      },
      (books) {
        emit(FeaturedBooksSuccess(books: books));
      },
    );
  }
}
