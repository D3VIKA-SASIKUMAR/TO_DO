import 'package:shared_preferences/shared_preferences.dart';

class DataSupplier {
  static SharedPreferences? _sp;

  static Future<SharedPreferences> _getSp() async {
    _sp ??= await SharedPreferences.getInstance();
    await _sp!.reload();
    return _sp!;
  }

  static Future<bool> saveList(String key, List<String> value) async {
    final sp = await _getSp();
    return await sp.setStringList(key, value);
  }

  static Future<List<String>> getList(String key) async {
    final sp = await _getSp();
    return sp.getStringList(key) ?? [];
  }

}
