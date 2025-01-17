import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:qltv/constant/router.dart';
import 'package:qltv/layouts/app_bar/index.dart';
import 'package:qltv/layouts/root/index.dart';
import 'package:qltv/pages/create_student/index.dart';
import 'package:qltv/pages/detail_student/index.dart';
import 'package:qltv/pages/null/index.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

class RouterManager {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    HookWidget screen = NullScreen();

    switch (settings.name) {
      case RouterName.createStudent:
        screen = CreateStudentScreen();
        break;
      case RouterName.detailStudent:
        screen =
            DetailStudentScreen(args: settings.arguments as ArgsDetailStudent);
        break;
      case RouterName.appBar:
        screen = AppBarLayout();
        break;
    }

    return MaterialPageRoute(builder: (context) {
      return RootLayout(
        screen: screen,
      );
    });
  }
}
