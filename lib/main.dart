import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:movieflix/core/modules/app_core_module.dart';
import 'package:sizer/sizer.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(ModularApp(
      module: AppCoreModule(),
      child: Sizer(builder: (context, orientation, deviceType) {
        return MaterialApp.router(
            locale: const Locale("pt", "BR"),
            routerConfig: Modular.routerConfig);
      })));
}
