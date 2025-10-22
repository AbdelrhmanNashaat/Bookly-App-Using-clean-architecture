import 'package:bookly_app_clean_architecture/Features/home/domain/use_cases/search_book_use_case.dart';
import 'package:bookly_app_clean_architecture/Features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/functions/service_locator.dart';
import '../../../home/data/repos/home_repo_impl.dart';
import 'widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider<SearchCubit>(
          create: (context) => SearchCubit(
            SearchBookUseCase(homeRepo: getIt.get<HomeRepoImpl>()),
          ),
          child: SearchViewBody(),
        ),
      ),
    );
  }
}
