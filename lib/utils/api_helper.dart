// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'dart:developer';

import 'package:unk/common/global.dart';
import 'package:unk/model/common_model.dart';
import 'package:unk/model/general_setting_model.dart';
import 'package:unk/model/home_model.dart';
import 'package:unk/model/login_model.dart';
import 'package:unk/model/user_data_model.dart';
import 'package:unk/utils/api_constant.dart';
import 'package:http/http.dart';

class ApiHelper {
  static Future<dynamic> commonApiCall({
    required String apiPath,
    required ApiType apiType,
    Map<String, String>? body,
  }) async {
    Uri uri = Uri.parse(base_url + apiPath);
    if (apiType == ApiType.GET) {
      log("Api Url -> ${base_url + apiPath}");
      return await getCall(uri: uri);
    } else if (apiType == ApiType.POST) {
      log("Api Url -> ${base_url + apiPath}");
      log("Api Body -> $body");
      return await postCall(uri: uri, body: body);
    }
  }

  static Future<dynamic> getCall({required Uri uri}) async {
    var response = await get(uri, headers: headers);
    if (response.body.startsWith('<!doctype html>')) {
      return null;
    }
    return jsonDecode(response.body);
  }

  static Future<dynamic> postCall({
    required Uri uri,
    Map<String, String>? body,
  }) async {
    var response = await post(uri, body: body, headers: headers);
    if (response.body.startsWith('<!doctype html>')) {
      return null;
    }
    return jsonDecode(response.body);
  }

  static Future<dynamic> directPostCall({
    required Uri uri,
    Map<String, String>? body,
  }) async {
    var response = await post(uri, body: body, headers: headers);
    if (response.body.startsWith('<!doctype html>')) {
      return null;
    }
    return jsonDecode(response.body);
  }

  static Future<void> getGeneralSettingData() async {
    var json = await commonApiCall(
      apiPath: 'general_setting.php',
      apiType: ApiType.GET,
    );
    if (json == null) {
      return;
    }
    GeneralSettingModel model = GeneralSettingModel.fromJson(json);
    generalSettingModel = model;
  }

  static Future<LoginModel> userLoginData({
    required LoginDataModel loginData,
  }) async {
    var json = await commonApiCall(
      apiPath: 'auth/login.php',
      apiType: ApiType.POST,
      body: {
        "email_id": loginData.email,
        "password": loginData.password,
      },
    );
    return LoginModel.fromJson(json);
  }

  static Future<LoginModel> userSignupData({
    required LoginDataModel signupData,
  }) async {
    var json = await commonApiCall(
      apiPath: 'auth/signup.php',
      apiType: ApiType.POST,
      body: {
        "email_id": signupData.email,
        "password": signupData.password,
      },
    );
    return LoginModel.fromJson(json);
  }

  static Future<CommonModel> addUserData({required UserData userData}) async {
    var json = await commonApiCall(
      apiPath: 'user_data/add_user_data.php',
      apiType: ApiType.POST,
      body: {
        "login_id": userData.loginId.toString(),
        "first_name": userData.firstName,
        "middle_name": userData.middleName,
        "last_name": userData.lastName,
        "date_of_birth": userData.lastName,
        "gender": userData.lastName,
        "contect_number": userData.lastName,
        "user_point": userData.userPoint,
        "profile_photo": userData.profilePhoto,
        "user_device_token": userData.userDeviceToken,
        "email_id": userData.emailId,
      },
    );
    return CommonModel.fromJson(json);
  }

  static Future<HomeModel> getHomeData() async {
    var json = await commonApiCall(
      apiPath: 'home/home_data_get.php',
      apiType: ApiType.GET,
    );
    return HomeModel.fromJson(json);
  }
}
