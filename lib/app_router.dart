import 'package:flutter/material.dart';
import 'package:moves_app/constants/routes.dart';
import 'package:moves_app/view/home/home_screen.dart';
import 'package:moves_app/view/movie_details/movie_details.dart';

class AppRouter {
  static Route generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case AppRoutesNames.movieDetailsRoute:
        return MaterialPageRoute(builder: (_) => const MovieDetailsScreen());

      default:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
  }
}
