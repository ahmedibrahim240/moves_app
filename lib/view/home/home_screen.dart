import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moves_app/logic/movies_cubit/movies_cubit.dart';
import 'package:moves_app/utils/extensions/size_config.dart';
import 'package:moves_app/widgets/loading_widget.dart';

import '../../widgets/custom_change_page_btn.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/error_widget.dart';
import '../../widgets/no_data_widget.dart';
import 'widget/moive_grad_view_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesCubit, MoviesState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: CustomText(
              text: "Movies",
              size: 18.sp,
            ),
            leadingWidth: 80,
            leading: Visibility(
              visible: BlocProvider.of<MoviesCubit>(context).initialPage > 1,
              child: FittedBox(
                child: ChangePageBtn(
                  isPrevious: true,
                  onPressed: () =>
                      BlocProvider.of<MoviesCubit>(context).getPreviousPage(),
                ),
              ),
            ),
            actions: [
              SizedBox(
                width: 80,
                child: FittedBox(
                  child: ChangePageBtn(
                    isPrevious: false,
                    onPressed: () =>
                        BlocProvider.of<MoviesCubit>(context).getNextPage(),
                  ),
                ),
              ),
            ],
          ),
          body: buildBody(state),
        );
      },
    );
  }

  buildBody(state) {
    switch (state) {
      case MoviesInitial():
      case MoviesLoading():
        return const LoadingWidget();
      case MoviesFailure():
        return CustomErrorWidget(
          error: state.error,
        );
      case MoviesListSuccess():
        return MoviesGradViewWidget(
          // showPreviousBtn: state.pageCount > 1,
          movies: state.movies,
        );

      default:
        return const EmptyDataWidget();
    }
  }
}
