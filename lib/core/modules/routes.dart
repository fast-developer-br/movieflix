class Routes {
  static get home => '/home';
  static get search => '/search';
  static get details => '/details';

  static String formatRoute(String route) {
    return '$route/';
  }
}
