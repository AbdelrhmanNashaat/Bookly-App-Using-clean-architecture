import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../home/domain/use_cases/search_book_use_case.dart';
import 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchBookUseCase searchBooksUseCase;

  SearchCubit(this.searchBooksUseCase) : super(SearchInitial());

  Future<void> getBooks(String query) async {
    emit(SearchLoading());
    final result = await searchBooksUseCase.execute(query);
    result.fold(
      (failure) => emit(SearchFailure(failure.errorMessage)),
      (books) => emit(SearchSuccess(books: books)),
    );
  }
}
