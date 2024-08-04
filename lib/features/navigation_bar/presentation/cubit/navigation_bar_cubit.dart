import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movieflix/core/modules/routes.dart';

part 'navigation_bar_state.dart';

class NavigationBarCubit extends Cubit<NavigationBarState> {
  NavigationBarCubit() : super(const NavigationBarInitial(currentIndex: 0));

  setCurrentIndex(int index, String routers) {
    Modular.to.navigate(Routes.formatRoute(routers));
    emit(NavigationBarInitial(currentIndex: index));
  }
}
