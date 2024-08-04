import 'package:flutter/material.dart';

import '../../../../../core/modules/routes.dart';
import '../navigation_bar_entity.dart';

class NavigationBarItemHomeEntity extends NavigationBarEntity {
  const NavigationBarItemHomeEntity(
      {required super.title, required super.icon, required super.route});

  factory NavigationBarItemHomeEntity.instance() {
    return NavigationBarItemHomeEntity(
        icon: Icons.home_outlined, title: 'Home', route: Routes.home);
  }
}
