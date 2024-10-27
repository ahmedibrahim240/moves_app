import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DefaultTextStyle(
        style: GoogleFonts.abel(
          // ignore: use_full_hex_values_for_flutter_colors
          color: const Color(0xfff6833ff),
          fontSize: 16,
        ),
        child: AnimatedTextKit(
          animatedTexts: [
            TyperAnimatedText('Loading....'),
          ],
        ),
      ),
    );
  }
}
