import 'package:flutter_modular/flutter_modular.dart';
import 'package:movieflix/core/modules/network_core_module.dart';
import 'package:movieflix/features/search/data/datasources/search_datasource.dart';
import 'package:movieflix/features/search/domain/repositories/search_repository.dart';
import 'package:movieflix/features/search/domain/usecases/search_movie_usecase.dart';
import 'package:movieflix/features/search/presentation/cubit/search/search_movie_cubit.dart';

import '../../core/modules/routes.dart';
import '../../core/utils/debouncer_utils.dart';
import '../details/details_module.dart';
import 'data/repositories/search_repository_impl.dart';
import 'presentation/search_page.dart';

class SearchModule extends Module {
  @override
  List<Module> get imports => [NetworkCoreModule()];

  @override
  void binds(Injector i) {
    super.binds(i);

    i.add<SearchDataSource>(ISearchDataSource.new);
    i.add<SearchRepository>(ISearchRepository.new);
    i.add(SearchMovieUsecase.new);
    i.addLazySingleton<SearchMovieCubit>(SearchMovieCubit.new);

    i.addLazySingleton<DebouncerUtils>(
        () => IDebouncerUtils(milliseconds: 700));
  }

  @override
  void routes(RouteManager r) {
    super.routes(r);
    r.child('/', child: (context) => const SearchPage());
    r.module(Routes.details, module: DetailsModule());
  }
}
