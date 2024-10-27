import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moves_app/constants/app_colors.dart';

class EmptyDataWidget extends StatelessWidget {
  const EmptyDataWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DefaultTextStyle(
        overflow: TextOverflow.clip,
        textAlign: TextAlign.center,
        style: GoogleFonts.abel(
          color: AppColors.kPrimaryColor,
          fontSize: 16,
        ),
        child: AnimatedTextKit(
          repeatForever: true,
          animatedTexts: [
            TyperAnimatedText('Data Not Found'),
          ],
        ),
      ),
    );
  }
}
