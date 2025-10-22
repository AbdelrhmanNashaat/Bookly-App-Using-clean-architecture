import '../../../../home/domain/entities/book_entity.dart';

class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchSuccess extends SearchState {
  final List<BookEntity> books;

  SearchSuccess({required this.books});
}

final class SearchFailure extends SearchState {
  final String errorMessage;
  SearchFailure(this.errorMessage);
}

final class SearchLoading extends SearchState {}
