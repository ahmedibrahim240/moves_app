import 'package:flutter/material.dart';
import 'package:moves_app/utils/extensions/size_config.dart';
import 'package:moves_app/widgets/custom_text.dart';

class ChangePageBtn extends StatelessWidget {
  final bool isPrevious;
  final void Function() onPressed;

  const ChangePageBtn(
      {super.key, this.isPrevious = false, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      iconAlignment: isPrevious ? IconAlignment.start : IconAlignment.end,
      icon: Icon(
        isPrevious ? Icons.arrow_back_ios_new : Icons.arrow_forward_ios,
        size: 30,
        color: Colors.white,
      ),
      label: CustomText(
        text: isPrevious ? "Previous page" : "Next page",
        color: Colors.white,
        size: 25.sp,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
