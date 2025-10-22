// use case is class handling repository method call and handling all business logic
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/use_case/no_param_use_case.dart';
import '../entities/book_entity.dart';
import '../repos/home_repo.dart';

class FetchFeaturedBooksUseCase extends NoParamUseCase<List<BookEntity>> {
  final HomeRepo homeRepo;
  FetchFeaturedBooksUseCase({required this.homeRepo});

  @override
  Future<Either<Failure, List<BookEntity>>> execute() async {
    // here it's not useful but in other cases we can add more business logic like checking permissions
    return await homeRepo.fetchFeaturedBooks();
  }
}
