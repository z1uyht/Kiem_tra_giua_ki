import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:qltv/constant/theme.dart';

class RootLayout extends HookWidget {
  final HookWidget screen;

  RootLayout({
    super.key,
    required this.screen,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = useState<bool>(false);

    useEffect(() {
      isDark.value = ThemeApp.isDarkMode;
      return;
    }, [ThemeApp.isDarkMode]);

    return Scaffold(
      body: SafeArea(
        child: DefaultTextStyle(
          style: TextStyle(
            color: isDark.value ? Colors.white : Colors.black, // Đổi màu chữ
          ),
          child: screen,
        ),
      ),
      backgroundColor: isDark.value ? Color(0xFF151517) : Colors.white,
    );
  }
}
