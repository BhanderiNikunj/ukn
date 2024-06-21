import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unk/common/colors.dart';
import 'package:unk/common/common_widget.dart';
import 'package:unk/screens/login/view/login_screen.dart';
import 'package:unk/utils/api_helper.dart';
import 'package:unk/widgets/images.dart';

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
        () => Get.to(LoginScreen(),),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CommonWidget.imageBuilder(
          height: double.infinity,
            width: double.infinity,
            imagePath:
                "https://homeincomeexpanseapi.000webhostapp.com/ukn_api/images/splash_screen/Splash%20Screen.jpg"),
      ),
    );
  }
}
