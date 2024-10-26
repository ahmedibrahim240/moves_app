import '../../constants/api_keys.dart';

class MoviePopularModel {
  final int? id;
  final String? title;
  final String? posterPath;
  final int? voteCount;
  final double? popularity, voteAverage;
  final String? backdropPath, overview, releaseDate;
  final List<MovieGenres>? genres;
  MoviePopularModel({
    this.genres,
    this.voteCount,
    this.popularity,
    this.voteAverage,
    this.backdropPath,
    this.overview,
    this.releaseDate,
    this.id,
    this.posterPath,
    this.title,
  });
  factory MoviePopularModel.fromJson(Map<String, dynamic> jsonMap) =>
      MoviePopularModel(
        id: jsonMap[ApiConstKeys.id],
        title: jsonMap[ApiConstKeys.title],
        posterPath: jsonMap[ApiConstKeys.posterPath],
      );
  factory MoviePopularModel.fromDetailsJson(Map<dynamic, dynamic> jsonMap) =>
      MoviePopularModel(
        id: jsonMap[ApiConstKeys.id],
        title: jsonMap[ApiConstKeys.title],
        posterPath: jsonMap[ApiConstKeys.posterPath],
        overview: jsonMap[ApiConstKeys.overview],
        voteAverage: jsonMap[ApiConstKeys.voteAverage],
        voteCount: jsonMap[ApiConstKeys.voteCount],
        popularity: jsonMap[ApiConstKeys.popularity],
        backdropPath: jsonMap[ApiConstKeys.backdropPath],
        genres: jsonMap[ApiConstKeys.genres] == null
            ? []
            : List<MovieGenres>.from(
                jsonMap[ApiConstKeys.genres]!.map(
                  (x) => MovieGenres.fromJson(x),
                ),
              ),
      );
}

class MovieGenres {
  int? id;
  String? name;
  MovieGenres({this.id, this.name});
  factory MovieGenres.fromJson(Map<String, dynamic> jsonMap) => MovieGenres(
        id: jsonMap[ApiConstKeys.id],
        name: jsonMap[ApiConstKeys.name],
      );
}
