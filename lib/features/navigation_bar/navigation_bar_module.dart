import 'package:flutter_modular/flutter_modular.dart';
import 'package:movieflix/features/navigation_bar/presentation/cubit/navigation_bar_cubit.dart';
import 'package:movieflix/features/navigation_bar/presentation/navigation_bar_page.dart';
import 'package:movieflix/features/search/search_module.dart';

import '../../core/modules/routes.dart';
import '../home/home_module.dart';

class NavigationBarModule extends Module {
  @override
  void binds(Injector i) {
    super.binds(i);
    i.addLazySingleton<NavigationBarCubit>(NavigationBarCubit.new);
  }

  @override
  void routes(RouteManager r) {
    super.routes(r);
    r.child('/', child: (context) => const NavigationBarPage(), children: [
      ModuleRoute(Routes.home, module: HomeModule()),
      ModuleRoute(Routes.search, module: SearchModule()),
    ]);
  }
}
