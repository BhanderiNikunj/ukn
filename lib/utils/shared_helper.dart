// ignore_for_file: constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

class SharedHelper {
  static const String LOGIN_KEY = "LOGIN_KEY";
  static const String LOGIN_ID_KEY = "LOGIN_ID_KEY";
   static const String Scratch_ID_KEY = "Scratch_ID_KEY";
  static SharedPreferences? sharedPreferences;

  static Future<void> setLoginValue({required bool isLogin}) async {
    if (sharedPreferences != null) {
      await sharedPreferences!.setBool(LOGIN_KEY, isLogin);
    } else {
      sharedPreferences = await SharedPreferences.getInstance();
      await sharedPreferences!.setBool(LOGIN_KEY, isLogin);
    }
  }

  static Future<void> setLoginData({required int loginId}) async {
    if (sharedPreferences != null) {
      await sharedPreferences!.setInt(LOGIN_ID_KEY, loginId);
    } else {
      sharedPreferences = await SharedPreferences.getInstance();
      await sharedPreferences!.setInt(LOGIN_ID_KEY, loginId);
    }
  }

   static Future<void> setScratchValue({required int isScratch}) async {
    if (sharedPreferences != null) {
      await sharedPreferences!.setInt(Scratch_ID_KEY, isScratch);
    } else {
      sharedPreferences = await SharedPreferences.getInstance();
      await sharedPreferences!.setInt(Scratch_ID_KEY, isScratch);
    }
  }

  static Future<bool> getLoginValue() async {
    bool isLogin = false;
    if (sharedPreferences != null) {
      isLogin = sharedPreferences!.getBool(LOGIN_KEY) ?? false;
    } else {
      sharedPreferences = await SharedPreferences.getInstance();
      isLogin = sharedPreferences!.getBool(LOGIN_KEY) ?? false;
    }
    return isLogin;
  }

  static Future<int> getLoginData() async {
    int loginId = 0;
    if (sharedPreferences != null) {
      loginId = sharedPreferences!.getInt(LOGIN_ID_KEY) ?? 0;
    } else {
      sharedPreferences = await SharedPreferences.getInstance();
      loginId = sharedPreferences!.getInt(LOGIN_ID_KEY) ?? 0;
    }
    return loginId;
  }

   static Future<int> getScratchValue() async {
    int isScratch = 1;
    if (sharedPreferences != null) {
      isScratch = sharedPreferences!.getInt(Scratch_ID_KEY) ?? 1;
    } else {
      sharedPreferences = await SharedPreferences.getInstance();
      isScratch = sharedPreferences!.getInt(Scratch_ID_KEY) ?? 1;
    }
    return isScratch;
  }
}
