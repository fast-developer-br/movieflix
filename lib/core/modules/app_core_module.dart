import 'package:flutter_modular/flutter_modular.dart';
import 'package:movieflix/core/modules/network_core_module.dart';
import 'package:movieflix/features/navigation_bar/navigation_bar_module.dart';

class AppCoreModule extends Module {
  @override
  void routes(RouteManager r) {
    super.routes(r);
    r.module('/', module: NavigationBarModule());
  }

  @override
  List<Module> get imports => [NetworkCoreModule()];
}
