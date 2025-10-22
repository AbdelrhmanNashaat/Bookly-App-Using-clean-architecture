import 'package:bookly_app_clean_architecture/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/use_case/use_case.dart';
import '../repos/home_repo.dart';

class SearchBookUseCase extends UseCase {
  final HomeRepo homeRepo;

  SearchBookUseCase({required this.homeRepo});
  @override
  Future<Either<Failure, dynamic>> execute([param]) async {
    return await homeRepo.searchBooks(query: param);
  }
}
