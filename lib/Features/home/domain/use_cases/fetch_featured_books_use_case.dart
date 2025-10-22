// use case is class handling repository method call and handling all business logic
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/book_entity.dart';
import '../repos/home_repo.dart';

class FetchFeaturedBooksUseCase {
  final HomeRepo homeRepo;
  FetchFeaturedBooksUseCase({required this.homeRepo});

  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks() {
    // here it's not useful but in other cases we can add more business logic like checking permissions
    return homeRepo.fetchFeaturedBooks();
  }
}
