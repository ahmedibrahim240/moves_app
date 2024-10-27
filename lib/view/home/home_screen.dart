import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moves_app/logic/movies_cubit/movies_cubit.dart';
import 'package:moves_app/utils/extensions/size_config.dart';
import 'package:moves_app/widgets/loading_widget.dart';

import '../../widgets/custom_text.dart';
import '../../widgets/error_widget.dart';
import '../../widgets/no_data_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "Movies",
          size: 18.sp,
        ),
      ),
      body: BlocBuilder<MoviesCubit, MoviesState>(
        builder: (_, state) {
          switch (state) {
            case MoviesInitial():
            case MoviesLoading():
              return const LoadingWidget();
            case MoviesFailure():
              return CustomErrorWidget(
                error: state.error,
              );
            case MoviesListSuccess():
              return Container();

            default:
              return const EmptyDataWidget();
          }
        },
      ),
    );
  }
}
