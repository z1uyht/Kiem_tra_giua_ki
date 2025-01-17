import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static SharedPreferences? _prefs;

  // Hàm khởi tạo để gọi trước khi sử dụng Prefs
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Getter để truy cập SharedPreferences
  static SharedPreferences get prefs {
    if (_prefs == null) {
      throw Exception('Prefs chưa được khởi tạo. Hãy gọi Prefs.init() trước.');
    }
    return _prefs!;
  }
}
