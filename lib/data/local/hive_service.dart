import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  static Future<void> initHive() async {
    await Hive.initFlutter();
    await Hive.openBox('settings');
    await Hive.openBox('cache');
  }

  static dynamic getValue(String boxName, String key) {
    return Hive.box(boxName).get(key);
  }

  static Future<void> setValue(String boxName, String key, dynamic value) async {
    await Hive.box(boxName).put(key, value);
  }

  static Future<void> clearAll() async {
    await Hive.box('settings').clear();
    await Hive.box('cache').clear();
  }
}
