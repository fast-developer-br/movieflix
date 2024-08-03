import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:movieflix/core/network/http_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
    Modular.get<HttpServices>().get(
        'https://api.themoviedb.org/3/movie/11?api_key=1019e8ecf4e06f155e24735b9f35f3ab');
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
