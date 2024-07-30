import 'package:flutter_modular/flutter_modular.dart';
import 'package:movieflix/features/home/presentation/home_page.dart';

class HomeModule extends Module {
  @override
  void routes(RouteManager r) {
    super.routes(r);
    r.child('/', child: (context) => const HomePage());
  }
}
