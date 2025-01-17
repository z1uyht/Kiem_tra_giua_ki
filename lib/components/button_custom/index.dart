import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ButtonCustom extends HookWidget {
  final String? text;
  final bool? loading;
  final void Function()? onPressed;

  ButtonCustom({
    this.text,
    this.loading,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: loading == true ? () {} : onPressed ?? () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF8E07C2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: loading == true
          ? LoadingAnimationWidget.twoRotatingArc(
              color: Color(0xFFFFFFFF),
              size: 18.0.sp,
            )
          : Text(
              text ?? "",
              style: TextStyle(color: Color(0xFFFFFFFF)),
            ),
    );
  }
}
