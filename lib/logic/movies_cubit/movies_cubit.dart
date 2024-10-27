import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../resource/models/movie_popular_model.dart';
import '../../resource/services/movies_api_services.dart';

part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit({required this.initialPage}) : super(MoviesInitial());
  int initialPage;
  void loadMoviePopular() {
    emit(MoviesLoading());
    MoviesService.instance.loadMoviePopular(initialPage).then(
          (value) => value.fold(
            (failure) => emit(MoviesFailure(error: failure.errorMessage)),
            (success) => emit(MoviesListSuccess(movies: success)),
          ),
        );
  }

  void getNextPage() {
    initialPage++;
    loadMoviePopular();
  }

  void getPreviousPage() {
    if (initialPage > 1) {
      initialPage--;
      loadMoviePopular();
    }
  }
}
