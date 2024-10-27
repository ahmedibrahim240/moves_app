part of 'movies_cubit.dart';

@immutable
sealed class MoviesState {}

final class MoviesInitial extends MoviesState {}

final class MoviesLoading extends MoviesState {}

final class MoviesListSuccess extends MoviesState {
  final List<MoviePopularModel> movies;

  MoviesListSuccess({required this.movies});
}

final class MoviesDetailsSuccess extends MoviesState {
  final MoviePopularModel movie;

  MoviesDetailsSuccess({required this.movie});
}

final class MoviesFailure extends MoviesState {
  final String error;

  MoviesFailure({required this.error});
}
