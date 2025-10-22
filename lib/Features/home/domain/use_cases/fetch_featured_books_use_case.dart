// use case is class handling repository method call and handling all business logic
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/use_case/use_case.dart';
import '../entities/book_entity.dart';
import '../repos/home_repo.dart';

class FetchFeaturedBooksUseCase extends UseCase<List<BookEntity>, int> {
  final HomeRepo homeRepo;
  FetchFeaturedBooksUseCase({required this.homeRepo});

  @override
  Future<Either<Failure, List<BookEntity>>> execute([
    int pageNumber = 0,
  ]) async {
    // here it's not useful but in other cases we can add more business logic like checking permissions
    return await homeRepo.fetchFeaturedBooks(pageNumber: pageNumber);
  }
}
