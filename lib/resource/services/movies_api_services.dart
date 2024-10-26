// ignore_for_file: unused_field

import 'package:tmdb_api/tmdb_api.dart';

import '../../constants/api_keys.dart';
import '../../utils/config/app_info.dart';
import '../../utils/errors/either.dart';
import '../../utils/errors/failures.dart';
import '../models/movie_popular_model.dart';

class MoviesService {
  static MoviesService instance = MoviesService();
  final TMDB _tmdb = TMDB(
    ApiKeys(AppInfo.API_TOKEN_V3, AppInfo.API_ACCESS_TOKEN_V4),
    logConfig: const ConfigLogger(
      showErrorLogs: true,
      showLogs: true,
    ),
  );
  Future<Either<Failure, List<MoviePopularModel>>> loadMoviePopular(
      int page) async {
    try {
      Map<dynamic, dynamic> response =
          await _tmdb.v3.movies.getPopular(page: page);
      return Right(List<MoviePopularModel>.from(
        response[ApiConstKeys.results].map(
          (x) => MoviePopularModel.fromJson(x),
        ),
      ));
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }

  Future<Either<Failure, MoviePopularModel>> loadMovieDetails(int id) async {
    try {
      Map<dynamic, dynamic> response = await _tmdb.v3.movies.getDetails(id);
      return Right(MoviePopularModel.fromDetailsJson(response));
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }
}
