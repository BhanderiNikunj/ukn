import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:unk/common/global.dart';
import 'package:unk/common/route_list.dart';
import 'package:unk/utils/api_helper.dart';

class UknApp extends StatefulWidget {
  const UknApp({super.key});

  @override
  State<UknApp> createState() => _UknAppState();
}

class _UknAppState extends State<UknApp> {
  @override
  void initState() {
    ApiHelper.getGeneralSettingData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        child: GetMaterialApp(
          initialRoute: RouteList.home_screen,
          getPages: getPages,
        ),
      ),
    );
  }
}
