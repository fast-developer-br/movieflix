import 'package:flutter/material.dart';

class CategoryTitleWidget extends StatelessWidget {
  final String title;
  const CategoryTitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(title, style: Theme.of(context).textTheme.titleMedium);
  }
}
