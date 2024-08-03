import 'package:flutter_modular/flutter_modular.dart';
import 'package:movieflix/core/modules/network_core_module.dart';

import '../../features/home/home_module.dart';

class AppCoreModule extends Module {
  @override
  void routes(RouteManager r) {
    super.routes(r);
    r.module('/', module: HomeModule());
  }

  @override
  List<Module> get imports => [NetworkCoreModule()];
}
