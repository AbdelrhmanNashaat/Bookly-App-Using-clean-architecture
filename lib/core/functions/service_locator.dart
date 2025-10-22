import 'package:bookly_app_clean_architecture/Features/home/data/data_sources/home_local_data_source_imp.dart';
import 'package:bookly_app_clean_architecture/Features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookly_app_clean_architecture/Features/home/data/data_sources/home_remote_data_source_impl.dart';
import 'package:bookly_app_clean_architecture/core/utils/api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../Features/home/data/repos/home_repo_impl.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  getIt.registerLazySingleton(() => Dio());

  getIt.registerLazySingleton(() => ApiService(dio: getIt<Dio>()));

  // Register by abstract type, not implementation
  getIt.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(apiService: getIt<ApiService>()),
  );

  getIt.registerLazySingleton(() => HomeLocalDataSourceImp());

  getIt.registerLazySingleton(
    () => HomeRepoImpl(
      homeRemoteDataSource: getIt<HomeRemoteDataSource>(),
      homeLocalDataSource: getIt<HomeLocalDataSourceImp>(),
    ),
  );
}
