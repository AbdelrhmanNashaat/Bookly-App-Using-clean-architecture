import 'package:go_router/go_router.dart';
import '../../Features/Splash/presentation/views/splash_view.dart';
import '../../Features/home/presentation/views/book_details_view.dart';
import '../../Features/home/presentation/views/home_view.dart';
import '../../Features/search/presentation/views/search_view.dart';
import '../../Features/home/domain/entities/book_entity.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSearchView = '/searchView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        name: 'splashView',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kSearchView,
        name: 'searchView',
        builder: (context, state) => const SearchView(),
      ),
      GoRoute(
        path: kHomeView,
        name: 'homeView',
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kBookDetailsView,
        name: 'bookDetailsView',
        builder: (context, state) {
          final book = state.extra as BookEntity;
          return BookDetailsView(book: book);
        },
      ),
    ],
  );
}
