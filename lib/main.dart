import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:qltv/bloc/index.dart';
import 'package:qltv/constant/router.dart';
import 'package:qltv/routers/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(
      RootBloc(
        child: RepaintBoundary(
          child: App(),
        ),
      ),
    );
  });
}

class App extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SafeArea(
            child: Scaffold(
              body: Navigator(
                key: rootNavigatorKey,
                initialRoute: RouterName.appBar,
                onGenerateRoute: (settings) {
                  return RouterManager.onGenerateRoute(settings);
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
