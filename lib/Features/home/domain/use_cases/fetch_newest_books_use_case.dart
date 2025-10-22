import 'package:bookly_app_clean_architecture/Features/home/domain/repos/home_repo.dart';
import 'package:bookly_app_clean_architecture/core/errors/failure.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/use_case/no_param_use_case.dart';
import '../entities/book_entity.dart';

class FetchNewestBooksUseCase extends NoParamUseCase {
  final HomeRepo homeRepo;

  FetchNewestBooksUseCase({required this.homeRepo});
  @override
  Future<Either<Failure, List<BookEntity>>> execute() async {
    return await homeRepo.fetchNewestBooks();
  }
}
