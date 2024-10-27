import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final bool isInButtonOrTab;
  final String text;
  final Color? color;
  final double? size, heighText;
  final int? maxLines;
  final TextOverflow? textOverflow;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final bool underline;
  final int? maxTextLiens;
  final double? letterSpacing;
  const CustomText({
    super.key,
    required this.text,
    this.color,
    this.size,
    this.letterSpacing,
    this.maxLines,
    this.textOverflow, //ThemeController
    this.fontWeight,
    this.heighText,
    this.textAlign,
    this.underline = false,
    this.maxTextLiens,
    this.isInButtonOrTab = false,
  });
  @override
  Widget build(BuildContext context) {
    return Text(
      maxTextLiens == null
          ? _capitalizeFirstLetter(text)
          : _capitalizeFirstLetter(text).length > maxTextLiens!
              ? '${_capitalizeFirstLetter(text).substring(0, maxTextLiens)}...'
              : _capitalizeFirstLetter(text),
      overflow: textOverflow ?? TextOverflow.ellipsis,
      maxLines: maxLines,
      textAlign: textAlign,
      style: GoogleFonts.abel(
        letterSpacing: letterSpacing,
        decoration: (!underline) ? null : TextDecoration.underline,
        color: color ?? Colors.white,
        fontSize: size ?? 16,
        fontWeight: fontWeight,
        height: heighText ?? 1,
      ),
    );
  }

  String _capitalizeFirstLetter(String input) {
    if (input.isEmpty) {
      return input;
    }
    return input[0].toUpperCase() + input.substring(1);
  }
}
