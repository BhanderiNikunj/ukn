import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:unk/common/global.dart';
import 'package:unk/common/route_list.dart';
import 'package:unk/utils/api_helper.dart';
import 'package:unk/utils/shared_helper.dart';

class UknApp extends StatefulWidget {
  const UknApp({super.key});

  @override
  State<UknApp> createState() => _UknAppState();
}

class _UknAppState extends State<UknApp> {
  @override
  void initState() {
    userDataGet();
    super.initState();
  }

  Future<void> userDataGet() async {
    ApiHelper.getGeneralSettingData();
    int userId = await SharedHelper.getUserIdata();
    if (userId != -1) {
      ApiHelper.readUserData(id: userId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        child: GetMaterialApp(
          initialRoute: RouteList.initial,
          getPages: getPages,
        ),
      ),
    );
  }
}
