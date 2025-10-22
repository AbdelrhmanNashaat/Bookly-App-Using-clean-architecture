import '../../../domain/entities/book_entity.dart';

abstract class FetchNewestBooksState {}

final class FetchNewestBooksInitial extends FetchNewestBooksState {}

final class FetchNewestBooksLoading extends FetchNewestBooksState {}

final class FetchNewestPaginationBooksLoading extends FetchNewestBooksState {}

final class FetchNewestBooksSuccess extends FetchNewestBooksState {
  final List<BookEntity> books;
  FetchNewestBooksSuccess({required this.books});
}

final class FetchNewestBooksFailure extends FetchNewestBooksState {
  final String errorMessage;
  FetchNewestBooksFailure(this.errorMessage);
}

final class FetchNewestPaginationBooksFailure extends FetchNewestBooksState {
  final String errorMessage;
  FetchNewestPaginationBooksFailure(this.errorMessage);
}
