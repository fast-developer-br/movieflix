import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:movieflix/features/navigation_bar/domain/entities/items/navigation_bar_item_home_entity.dart';
import 'package:movieflix/features/navigation_bar/domain/entities/navigation_bar_entity.dart';
import 'package:movieflix/shared/widgets/app_bar/app_bar_widget.dart';
import 'package:sizer/sizer.dart';

import '../domain/entities/items/navigation_bar_item_search_entity.dart';
import 'cubit/navigation_bar_cubit.dart';

class NavigationBarPage extends StatefulWidget {
  const NavigationBarPage({super.key});

  @override
  State<NavigationBarPage> createState() => _NavigationBarPageState();
}

class _NavigationBarPageState extends State<NavigationBarPage> {
  final _items = <NavigationBarEntity>[
    NavigationBarItemHomeEntity.instance(),
    NavigationBarItemSearchEntity.instance()
  ];

  int _activeIndex = 0;

  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
    Modular.get<NavigationBarCubit>().setCurrentIndex(0, _items.first.route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarWidget(),
        body: Padding(
          padding: EdgeInsets.all(2.h),
          child: const RouterOutlet(),
        ),
        bottomNavigationBar:
            BlocBuilder<NavigationBarCubit, NavigationBarState>(
          bloc: Modular.get<NavigationBarCubit>(),
          builder: (context, state) {
            _activeIndex = state.currentIndex;

            return BottomNavigationBar(
              items: _items
                  .map((i) =>
                      BottomNavigationBarItem(icon: Icon(i.icon), label: ''))
                  .toList(),
              currentIndex: _activeIndex,
              onTap: (index) {
                Modular.get<NavigationBarCubit>()
                    .setCurrentIndex(index, _items[index].route);
              },
            );
          },
        ));
  }
}
