import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class NavigationBarEntity extends Equatable {
  final String title;
  final IconData icon;
  final String route;

  const NavigationBarEntity(
      {required this.title, required this.icon, required this.route});

  @override
  List<Object?> get props => [title, icon, route];
}
