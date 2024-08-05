import 'package:flutter/material.dart';

class AppColors {
  static const themeDark = Color.fromRGBO(20, 20, 20, 1);
  static const white = Colors.white;
  static const backgroundRating = Color.fromRGBO(13, 28, 33, 1);
  static const backgroundSearchBar = Color.fromARGB(255, 37, 37, 37);
  static const grey = Colors.grey;
  static const red = Color.fromARGB(255, 220, 30, 62);

  static Color getRatingColorPrimary(int rating) {
    if (rating >= 70) {
      return Colors.green;
    } else if (rating < 70 && rating >= 50) {
      return Colors.yellow;
    } else if (rating < 50 && rating > 0) {
      return Colors.red;
    } else {
      return Colors.grey[100]!;
    }
  }
}
