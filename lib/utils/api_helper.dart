// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:flutter/foundation.dart';
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
      return await getCall(uri: uri);
    } else if (apiType == ApiType.POST) {
      return await postCall(uri: uri, body: body);
    }
  }

  static Future<dynamic> getCall({required Uri uri}) async {
    var response = await get(
      uri,
      headers: {
        "Accept": "application/json",
        "X-localization": "en",
      },
    );
    return jsonDecode(response.body);
  }

  static Future<dynamic> postCall({
    required Uri uri,
    Map<String, String>? body,
  }) async {
    var response = await post(
      uri,
      body: body,
      headers: {
        "Accept": "application/json",
        "X-localization": "en",
      },
    );
    return jsonDecode(response.body);
  }

  static Future<void> getGeneralSettingData() async {
    var json = await commonApiCall(
      apiPath: 'general_setting.php',
      apiType: ApiType.GET,
    );
    if (kDebugMode) {
      print("=============$json");
    }
  }
}
