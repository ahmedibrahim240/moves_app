import 'package:flutter/material.dart';
import 'package:moves_app/utils/extensions/size_config.dart';
import 'package:moves_app/utils/utils.dart';
import 'package:moves_app/widgets/custom_text.dart';

import '../../../constants/app_colors.dart';
import '../../../resource/models/movie_popular_model.dart';

import '../../../widgets/custom_cached_net_image.dart';

class MovieCardItem extends StatelessWidget {
  final MoviePopularModel movie;
  const MovieCardItem({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        // color: MyColors.myWhite,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.kPrimaryColor, width: .75),
      ),
      child: GridTile(
        footer: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          color: Colors.black54,
          alignment: Alignment.bottomCenter,
          child: CustomText(
            text: movie.title ?? '',
            maxLines: 2,
            textAlign: TextAlign.center,
            size: 16.sp,
            heighText: 1.3,
            textOverflow: TextOverflow.clip,
          ),
        ),
        child: CustomCachedNetworkImage(
          context: context,
          borderRadius: 9,
          url: Utils.getImageUrl(
            movie.posterPath.toString(),
          ),
          boxFit: BoxFit.cover,
        ),
      ),
    );
  }
}
