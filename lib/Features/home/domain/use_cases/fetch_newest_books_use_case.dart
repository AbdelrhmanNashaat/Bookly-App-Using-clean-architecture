import 'package:bookly_app_clean_architecture/Features/home/domain/repos/home_repo.dart';
import 'package:bookly_app_clean_architecture/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/use_case/use_case.dart';
import '../entities/book_entity.dart';

class FetchNewestBooksUseCase extends UseCase<List<BookEntity>, int> {
  final HomeRepo homeRepo;

  FetchNewestBooksUseCase({required this.homeRepo});
  @override
  Future<Either<Failure, List<BookEntity>>> execute([
    int pageNumber = 0,
  ]) async {
    return await homeRepo.fetchNewestBooks(pageNumber: pageNumber);
  }
}
