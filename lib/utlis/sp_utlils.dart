import 'package:shared_preferences/shared_preferences.dart';

class SpUtlis {
  SharedPreferences? prefs;

  SpUtlis._() {
    init();
  }
  static SpUtlis? _instance;

  SpUtlis._pre(SharedPreferences this.prefs);

  ///预初始化，防止在使用get 时，prefs 还没完成。
  static Future<SpUtlis> preInit() async {
    if (_instance == null) {
      var prefs = await SharedPreferences.getInstance();
      _instance = SpUtlis._pre(prefs);
    }
    return _instance!;
  }

  static SpUtlis? getInstance() {
    _instance ??= SpUtlis._();
    return _instance;
  }

  void init() async {
    prefs ??= await SharedPreferences.getInstance();
  }

  setString(String key, String value) {
    prefs?.setString(key, value);
  }

  setDouble(String key, double value) {
    prefs?.setDouble(key, value);
  }

  setInt(String key, int value) {
    prefs?.setInt(key, value);
  }

  setBool(String key, bool value) {
    prefs?.setBool(key, value);
  }

  setStringList(String key, List<String> value) {
    prefs?.setStringList(key, value);
  }

  T? get<T>(String key) {
    final value = prefs?.get(key);
    if (value is T) {
      return value;
    } else {
      return null;
    }
  }
}