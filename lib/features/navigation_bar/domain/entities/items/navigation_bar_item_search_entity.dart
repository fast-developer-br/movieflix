import 'package:flutter/material.dart';
import 'package:movieflix/features/navigation_bar/domain/entities/navigation_bar_entity.dart';

import '../../../../../core/modules/routes.dart';

class NavigationBarItemSearchEntity extends NavigationBarEntity {
  const NavigationBarItemSearchEntity(
      {required super.title, required super.icon, required super.route});

  factory NavigationBarItemSearchEntity.instance() {
    return NavigationBarItemSearchEntity(
        icon: Icons.search, title: 'Pesquisar', route: Routes.search);
  }
}
