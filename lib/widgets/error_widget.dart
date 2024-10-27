import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomErrorWidget extends StatelessWidget {
  final String error;
  const CustomErrorWidget({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DefaultTextStyle(
        overflow: TextOverflow.clip,
        textAlign: TextAlign.center,
        style: GoogleFonts.abel(
          color: Colors.red,
          fontSize: 16,
        ),
        child: AnimatedTextKit(
          repeatForever: true,
          animatedTexts: [
            TyperAnimatedText(
              'Error\n$error',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
