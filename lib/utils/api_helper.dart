// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'dart:developer';

import 'package:unk/common/global.dart';
import 'package:unk/model/general_setting_model.dart';
import 'package:unk/model/login_model.dart';
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
    return jsonDecode(response.body);
  }

  static Future<dynamic> postCall({
    required Uri uri,
    Map<String, String>? body,
  }) async {
    var response = await post(uri, body: body, headers: headers);
    return jsonDecode(response.body);
  }

  static Future<void> getGeneralSettingData() async {
    var json = await commonApiCall(
      apiPath: 'general_setting.php',
      apiType: ApiType.GET,
    );

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
}
