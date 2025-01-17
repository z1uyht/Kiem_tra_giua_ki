import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TabCustom extends HookWidget {
  final String url;
  final bool active;
  final VoidCallback? onTab;

  TabCustom({
    required this.url,
    required this.active,
    this.onTab,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab ?? () {},
      child: Container(
        decoration: active
            ? BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF8E06C2),
                    blurRadius: 16.0.sp,
                    offset: Offset(0, 0),
                  ),
                ],
              )
            : null,
        child: SvgPicture.asset(
          url,
          height: 28.0.sp,
          width: 28.0.sp,
          colorFilter: ColorFilter.mode(
            active ? Color(0xFF8E06C2) : Colors.white,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
