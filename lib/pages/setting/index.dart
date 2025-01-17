import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:qltv/constant/router.dart';
import 'package:qltv/constant/theme.dart';
import 'package:qltv/routers/index.dart';

class SettingsScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            ThemeApp.isDarkMode = !ThemeApp.isDarkMode;
            rootNavigatorKey.currentState!.pushNamed(RouterName.appBar);
          },
          child: Text("Đổi nền"),
        ),
      ),
    );
  }
}
