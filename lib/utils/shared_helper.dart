// ignore_for_file: constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

class SharedHelper {
  static const String LOGIN_KEY = "LOGIN_KEY";
  static const String LOGIN_ID_KEY = "LOGIN_ID_KEY";
  static const String Scratch_ID_KEY = "Scratch_ID_KEY";
  static const String USER_ID_KEY = "USER_ID_KEY";
  static const String SCRATCH_CARD_KEY = "SCRATCH_CARD_KEY";

  static SharedPreferences? sharedPreferences;

  static Future<void> setLoginValue({required bool isLogin}) async {
    if (sharedPreferences != null) {
      await sharedPreferences!.setBool(LOGIN_KEY, isLogin);
    } else {
      sharedPreferences = await SharedPreferences.getInstance();
      await sharedPreferences!.setBool(LOGIN_KEY, isLogin);
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

  static Future<void> setLoginData({required int loginId}) async {
    if (sharedPreferences != null) {
      await sharedPreferences!.setInt(LOGIN_ID_KEY, loginId);
    } else {
      sharedPreferences = await SharedPreferences.getInstance();
      await sharedPreferences!.setInt(LOGIN_ID_KEY, loginId);
    }
  }

  static Future<int> getLoginData() async {
    int loginId = 0;
    if (sharedPreferences != null) {
      loginId = sharedPreferences!.getInt(LOGIN_ID_KEY) ?? -1;
    } else {
      sharedPreferences = await SharedPreferences.getInstance();
      loginId = sharedPreferences!.getInt(LOGIN_ID_KEY) ?? -1;
    }
    return loginId;
  }

  static Future<void> setScratchValue({required int isScratch}) async {
    if (sharedPreferences != null) {
      await sharedPreferences!.setInt(Scratch_ID_KEY, isScratch);
    } else {
      sharedPreferences = await SharedPreferences.getInstance();
      await sharedPreferences!.setInt(Scratch_ID_KEY, isScratch);
    }
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

  static Future<void> setUserIdata({required int userId}) async {
    if (sharedPreferences != null) {
      await sharedPreferences!.setInt(USER_ID_KEY, userId);
    } else {
      await sharedPreferences!.setInt(USER_ID_KEY, userId);
    }
  }

  static Future<int> getUserIdata() async {
    int userID = 0;
    if (sharedPreferences != null) {
      userID = sharedPreferences!.getInt(USER_ID_KEY) ?? -1;
    } else {
      sharedPreferences = await SharedPreferences.getInstance();
      userID = sharedPreferences!.getInt(USER_ID_KEY) ?? -1;
    }
    return userID;
  }

  static Future<void> setYourScratchList({required bool isScratch}) async {
    if (sharedPreferences != null) {
      await sharedPreferences!.setBool(SCRATCH_CARD_KEY, isScratch);
    } else {
      await sharedPreferences!.setBool(USER_ID_KEY, isScratch);
    }
  }

  static Future<bool> getYourScratchList() async {
    bool userID = false;
    if (sharedPreferences != null) {
      userID = sharedPreferences!.getBool(SCRATCH_CARD_KEY) ?? false;
    } else {
      sharedPreferences = await SharedPreferences.getInstance();
      userID = sharedPreferences!.getBool(SCRATCH_CARD_KEY) ?? false;
    }
    return userID;
  }
}
