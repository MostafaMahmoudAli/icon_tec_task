import 'package:dartz/dartz.dart';

import 'package:shared_preferences/shared_preferences.dart';

abstract class CacheService {
  T? getData<T>({required String key});

  Future<Unit> setData({required String key, required dynamic value});

  Future<Unit> clear();
}

class CacheServiceImpl extends CacheService {
  final SharedPreferences pref;

  CacheServiceImpl({required this.pref});

  @override
  T? getData<T>({required String key}) {
    T? value;
    if (T.toString() == 'int') {
      value = pref.getInt(key) as T?;
    }
    if (T.toString() == 'double') {
      value = pref.getDouble(key) as T?;
    }
    if (T.toString() == 'bool') {
      value = pref.getBool(key) as T?;
    }
    if (T.toString() == 'String') {
      value = pref.getString(key) as T?;
    }

    return value;
  }

  @override
  Future<Unit> setData({required String key, required dynamic value}) async {

    bool isSetDone = false;
    if (value is int) {
      isSetDone = await pref.setInt(key, value);
    }
    if (value is double) {
      isSetDone = await pref.setDouble(key, value);
    }
    if (value is bool) {
      isSetDone = await pref.setBool(key, value);
    }
    if (value is String) {
      isSetDone = await pref.setString(key, value);
    }
    if (value == null) {
      isSetDone = await pref.remove(key);
    }

    return Future.value(unit);
  }

  @override
  Future<Unit> clear() async {

    final clear = await pref.clear();

    return Future.value(unit);
  }
}
