import 'package:flutter_modular/flutter_modular.dart';
import 'package:movieflix/features/home/data/datasources/home_datasource.dart';
import 'package:movieflix/features/home/data/repositories/home_repository_impl.dart';
import 'package:movieflix/features/home/domain/repositories/home_repository.dart';
import 'package:movieflix/features/home/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:movieflix/features/home/domain/usecases/get_upcoming_movies_usecase.dart';
import 'package:movieflix/features/home/presentation/cubits/popular/movies/popular_movies_cubit.dart';
import 'package:movieflix/features/home/presentation/cubits/upcoming/movies/upcoming_movies_cubit.dart';
import 'package:movieflix/features/home/presentation/home_page.dart';

import '../../core/modules/network_core_module.dart';
import 'domain/usecases/get_popular_movies_usecase.dart';
import 'presentation/cubits/top_rated/movies/top_rated_movies_cubit.dart';
import 'presentation/cubits/upcoming/carousel/upcoming_carousel_cubit.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [NetworkCoreModule()];

  @override
  void binds(Injector i) {
    super.binds(i);

    i.add<HomeDatasource>(IHomeDataSource.new);
    i.add<HomeRepository>(IHomeRespository.new);
    i.add(GetUpcomingMoviesUsecase.new);
    i.addLazySingleton<UpcomingMoviesCubit>(UpcomingMoviesCubit.new);
    i.addLazySingleton<UpcomingCarouselCubit>(UpcomingCarouselCubit.new);
    i.addLazySingleton<GetPopularMoviesUsecase>(GetPopularMoviesUsecase.new);
    i.addLazySingleton<PopularMoviesCubit>(PopularMoviesCubit.new);
    i.addLazySingleton<GetTopRatedMoviesUsecase>(GetTopRatedMoviesUsecase.new);
    i.addLazySingleton<TopRatedMoviesCubit>(TopRatedMoviesCubit.new);
  }

  @override
  void routes(RouteManager r) {
    super.routes(r);
    r.child('/', child: (context) => const HomePage());
  }
}
