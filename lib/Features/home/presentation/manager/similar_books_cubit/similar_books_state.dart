import '../../../domain/entities/book_entity.dart';

abstract class SimilarBooksState {}

final class SimilarBooksInitial extends SimilarBooksState {}

final class SimilarBooksLoading extends SimilarBooksState {}

final class SimilarBooksPaginationLoading extends SimilarBooksState {}

final class SimilarBooksSuccess extends SimilarBooksState {
  final List<BookEntity> books;

  SimilarBooksSuccess({required this.books});
}

final class SimilarBooksFailure extends SimilarBooksState {
  final String errorMessage;

  SimilarBooksFailure({required this.errorMessage});
}

final class SimilarBooksPaginationFailure extends SimilarBooksState {
  final String errorMessage;

  SimilarBooksPaginationFailure({required this.errorMessage});
}
