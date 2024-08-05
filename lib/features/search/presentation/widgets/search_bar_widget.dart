import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movieflix/core/utils/debouncer_utils.dart';
import 'package:movieflix/features/search/presentation/cubit/search/search_movie_cubit.dart';
import 'package:movieflix/shared/colors/app_colors.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SearchBar(
        padding: const WidgetStatePropertyAll<EdgeInsets>(
            EdgeInsets.symmetric(horizontal: 16.0)),
        trailing: const [Icon(Icons.search, color: AppColors.white)],
        textStyle: WidgetStatePropertyAll<TextStyle>(
            Theme.of(context).textTheme.bodyMedium!),
        backgroundColor:
            const WidgetStatePropertyAll<Color>(AppColors.backgroundSearchBar),
        onChanged: (search) async {
          await Modular.get<DebouncerUtils>().run(() {
            Modular.get<SearchMovieCubit>().searchMovie(search: search);
          });
        },
      ),
    );
  }
}
