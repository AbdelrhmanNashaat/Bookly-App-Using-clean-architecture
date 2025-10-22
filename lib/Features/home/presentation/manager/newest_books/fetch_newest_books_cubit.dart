import 'package:bookly_app_clean_architecture/Features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'fetch_newest_books_state.dart';

class FetchNewestBooksCubit extends Cubit<FetchNewestBooksState> {
  final FetchNewestBooksUseCase fetchNewestBooksUseCase;
  FetchNewestBooksCubit({required this.fetchNewestBooksUseCase})
    : super(FetchNewestBooksInitial());

  Future<void> fetchNewestBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(FetchNewestBooksLoading());
    } else {
      emit(FetchNewestPaginationBooksLoading());
    }
    final result = await fetchNewestBooksUseCase.execute(pageNumber);
    result.fold(
      (failure) {
        if (pageNumber == 0) {
          emit(FetchNewestBooksFailure(failure.errorMessage));
        } else {
          emit(FetchNewestPaginationBooksFailure(failure.errorMessage));
        }
        emit(FetchNewestBooksFailure(failure.errorMessage));
      },
      (books) {
        emit(FetchNewestBooksSuccess(books: books));
      },
    );
  }
}
