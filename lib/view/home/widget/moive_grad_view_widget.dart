import 'package:flutter/material.dart';

import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

import '../../../resource/models/movie_popular_model.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';

import 'movie_card_item.dart';

class MoviesGradViewWidget extends StatelessWidget {
  final List<MoviePopularModel> movies;
  const MoviesGradViewWidget({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 3,
      mainAxisSpacing: 1.5,
      crossAxisSpacing: 1.5,
      padding: const EdgeInsets.symmetric(vertical: 10),
      itemCount: movies.length,
      staggeredTileBuilder: (index) => StaggeredTile.count(
        (index % 7 == 0) ? 2 : 1,
        (index % 7 == 0) ? 2 : 2,
      ),
      itemBuilder: (_, index) {
        MoviePopularModel movie = movies[index];
        return MovieCardItem(movie: movie);
      },
    );
  }
}
