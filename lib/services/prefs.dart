import 'package:shared_preferences/shared_preferences.dart';

import '../keys/prefs.dart';

class PrefService {
  SharedPreferences? _prefs;

  Future<void> prefInit() async {
    _prefs = _prefs ?? await SharedPreferences.getInstance();
  }

  bool get isLogin {
    final prefBool = _prefs?.getBool(KeysPref.isLogin);
    return prefBool == null ? false : true;
  }

  Future<bool>? setIsLogin(bool login) {
    return _prefs?.setBool(KeysPref.isLogin, login);
  }

  /// for getting string from box
  String? get getUserName {
    return _prefs?.getString(KeysPref.userName);
  }

  /// for storingtCustomer to app
  Future<void> putUserName(String token) async {
    await _prefs?.setString(KeysPref.userName, token);
  }

  Future<void> removeUserName() async {
    await _prefs?.remove(KeysPref.userName);
  }

  /// for getting string from box
  String? get getUserPhone {
    return _prefs?.getString(KeysPref.userPhone);
  }

  /// for storingtCustomer to app
  Future<void> putUserPhone(String phone) async {
    await _prefs?.setString(KeysPref.userPhone, phone);
  }

  Future<void> removeUserPhone() async {
    await _prefs?.remove(KeysPref.userPhone);
  }

  /// for getting string from box
  String? get getUserAddress {
    return _prefs?.getString(KeysPref.userAddress);
  }

  /// for storingtCustomer to app
  Future<void> putUserAddress(String address) async {
    await _prefs?.setString(KeysPref.userAddress, address);
  }

  Future<void> removeUserAddress() async {
    await _prefs?.remove(KeysPref.userAddress);
  }

  /// for clearing all data in box
  Future<void> clearAllData() async {
    await _prefs?.clear();
  }
}
