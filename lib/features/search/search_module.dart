import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/search_page.dart';

class SearchModule extends Module {
  @override
  void routes(RouteManager r) {
    super.routes(r);
    r.child('/', child: (context) => const SearchPage());
  }
}
