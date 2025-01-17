import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qltv/components/tab_custom/index.dart';
import 'package:qltv/constant/router.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:qltv/pages/manager_student/index.dart';
import 'package:qltv/pages/null/index.dart';
import 'package:qltv/pages/setting/index.dart';

class AppBarLayout extends HookWidget {
  final GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>();

  AppBarLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final curUrl = useState<String>(RouterName.appBarManagerStudent);

    void changeScreen(String url) {
      curUrl.value = url;
      globalKey.currentState!.pushNamed(url);
    }

    useEffect(() {
      print(curUrl.value);
      return null;
    }, [curUrl.value]);

    HookWidget render(RouteSettings settings) {
      switch (settings.name) {
        case RouterName.appBarManagerStudent:
          return ManagerStudentScreen();
        case RouterName.appBarSetting:
          return SettingsScreen();
        default:
          return NullScreen();
      }
    }

    double fullWidth = MediaQuery.of(context).size.width;
    double tabHeight = 50.0.sp;

    return Container(
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: fullWidth,
              child: Navigator(
                key: globalKey,
                initialRoute: RouterName.appBarManagerStudent,
                onGenerateRoute: (settings) {
                  return MaterialPageRoute(
                    builder: (context) => render(settings),
                  );
                },
              ),
            ),
          ),
          Container(
            height: tabHeight,
            width: fullWidth,
            color: Color(0xFF0C0C0C),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TabCustom(
                  url: "assets/icons/book-svgrepo-com.svg",
                  active: curUrl.value == RouterName.appBarManagerStudent
                      ? true
                      : false,
                  onTab: () => changeScreen(RouterName.appBarManagerStudent),
                ),
                TabCustom(
                  url: "assets/icons/setting-5-svgrepo-com.svg",
                  active:
                      curUrl.value == RouterName.appBarSetting ? true : false,
                  onTab: () => changeScreen(RouterName.appBarSetting),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
