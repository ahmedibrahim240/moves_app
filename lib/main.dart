import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:moves_app/app_router.dart';
import 'package:moves_app/constants/app_colors.dart';
import 'package:moves_app/logic/app_bloc_observer.dart';
import 'package:moves_app/logic/movies_cubit/movies_cubit.dart';

import 'utils/extensions/size_config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  Bloc.observer = AppBlocObserver();
  runApp(const MovesApp());
}

class MovesApp extends StatefulWidget {
  const MovesApp({super.key});

  @override
  State<MovesApp> createState() => _MovesAppState();
}

class _MovesAppState extends State<MovesApp> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FlutterNativeSplash.remove();
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context, designSize: const Size(360, 800));

    return BlocProvider(
      create: (context) => MoviesCubit(initialPage: 1),
      child: MaterialApp(
        title: 'Moves',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: AppColors.kPrimaryColor,
          appBarTheme: const AppBarTheme(
            elevation: 0,
            centerTitle: true,
            backgroundColor: Color.fromARGB(255, 215, 0, 0),
          ),
        ),
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
