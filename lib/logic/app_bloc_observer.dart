import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moves_app/logic/movies_cubit/movies_cubit.dart';
import 'package:moves_app/utils/extensions/extensions.dart';

class AppBlocObserver implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    logPrint("onCreate:$change");
  }

  @override
  void onClose(BlocBase bloc) {}

  @override
  void onCreate(BlocBase bloc) {
    if (bloc is MoviesCubit) {
      if (bloc.state is MoviesInitial) {
        bloc.loadMoviePopular();
      }
    }
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {}

  @override
  void onEvent(Bloc bloc, Object? event) {}

  @override
  void onTransition(Bloc bloc, Transition transition) {}
}
