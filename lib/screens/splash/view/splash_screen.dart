import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:unk/common/common_widget.dart';
import 'package:unk/common/global.dart';
import 'package:unk/screens/login/view/login_screen.dart';
import 'package:unk/utils/api_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    ApiHelper.getGeneralSettingData();
    super.initState();
    Timer(
      Duration(seconds: 10),
      () => Get.to(
        LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CommonWidget.imageBuilder(
          height: ScreenUtil().screenHeight,
          width: ScreenUtil().screenWidth,
          imagePath: splashImage,
        ),
      ),
    );
  }
}
