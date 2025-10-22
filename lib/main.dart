import 'package:bookly_app_clean_architecture/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app_clean_architecture/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_clean_architecture/Features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:bookly_app_clean_architecture/Features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app_clean_architecture/Features/home/presentation/manager/newest_books/fetch_newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'Features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'constants.dart';
import 'core/utils/app_router.dart';
import 'core/functions/service_locator.dart';
import 'core/utils/simple_bloc_observer.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>(kFeaturedBooks);
  await Hive.openBox<BookEntity>(kNewestBooks);
  await Hive.openBox<BookEntity>(kSimilarBooks);
  await setupServiceLocator();
  Bloc.observer = SimpleBlocObserver();
  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(
            fetchFeaturedBooksUseCase: FetchFeaturedBooksUseCase(
              homeRepo: getIt.get<HomeRepoImpl>(),
            ),
          )..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) => FetchNewestBooksCubit(
            fetchNewestBooksUseCase: FetchNewestBooksUseCase(
              homeRepo: getIt.get<HomeRepoImpl>(),
            ),
          )..fetchNewestBooks(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme: GoogleFonts.montserratTextTheme(
            ThemeData.dark().textTheme,
          ),
        ),
      ),
    );
  }
}
