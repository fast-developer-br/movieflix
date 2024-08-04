import 'package:expandable_richtext/expandable_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:movieflix/shared/colors/app_colors.dart';

class DetailsMovieOverviewWidget extends StatelessWidget {
  final String overview;
  const DetailsMovieOverviewWidget({super.key, required this.overview});

  @override
  Widget build(BuildContext context) {
    return ExpandableRichText(
      overview,
      style: Theme.of(context).textTheme.bodySmall,
      expandText: 'Mais',
      collapseText: 'Menos',
      maxLines: 3,
      toggleTextStyle:
          const TextStyle(color: AppColors.red, fontWeight: FontWeight.bold),
    );
  }
}
