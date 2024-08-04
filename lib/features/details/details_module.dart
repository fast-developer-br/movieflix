import 'package:flutter_modular/flutter_modular.dart';
import 'package:movieflix/core/modules/network_core_module.dart';
import 'package:movieflix/features/details/data/datasources/details_datasource.dart';
import 'package:movieflix/features/details/domain/repositories/details_repository.dart';
import 'package:movieflix/features/details/domain/usecases/get_movie_cast_usecase.dart';
import 'package:movieflix/features/details/presentation/cubit/cast/movie_cast_cubit.dart';
import 'package:movieflix/features/details/presentation/details_page.dart';

import 'data/repositories/details_repository_impl.dart';

class DetailsModule extends Module {
  @override
  List<Module> get imports => [NetworkCoreModule()];

  @override
  void binds(Injector i) {
    super.binds(i);

    i.add<DetailsDatasource>(IDetailsDataSource.new);
    i.add<DetailsRepository>(IDetailsRepository.new);
    i.add(GetMovieCastUsecase.new);
    i.addLazySingleton<MovieCastCubit>(MovieCastCubit.new);
  }

  @override
  void routes(RouteManager r) {
    super.routes(r);
    r.child('/', child: (context) => DetailsPage(movie: r.args.data['movie']));
  }
}
