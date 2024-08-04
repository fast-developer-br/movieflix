part of 'navigation_bar_cubit.dart';

abstract class NavigationBarState extends Equatable {
  final int currentIndex;
  const NavigationBarState({required this.currentIndex});

  @override
  List<Object> get props => [currentIndex];
}

class NavigationBarInitial extends NavigationBarState {
  const NavigationBarInitial({required super.currentIndex});
}
