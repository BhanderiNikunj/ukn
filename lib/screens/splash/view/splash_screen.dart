import 'package:flutter/material.dart';
import 'package:unk/common/colors.dart';
import 'package:unk/common/common_router.dart';
import 'package:unk/common/common_widget.dart';
import 'package:unk/common/global.dart';
import 'package:unk/common/route_list.dart';
import 'package:unk/utils/ads_helper.dart';
import 'package:unk/utils/shared_helper.dart';
import 'package:unk/widgets/images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int splashDuration = 3;

  @override
  void initState() {
    loadAdAndNavigateScreen();
    super.initState();
  }

  Future<void> loadAdAndNavigateScreen() async {
    await AdsHelper.loadAppOpenAd(adType: AdType.admob);
    bool isLogin = await SharedHelper.getLoginValue();
    await Future.delayed(
      Duration(seconds: splashDuration),
      () {
        if (isLogin) {
          CommonRoute.popAndPushNamed(page: RouteList.home_screen);
        } else {
          CommonRoute.popAndPushNamed(page: RouteList.login_screen);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary1Color,
      body: Center(
        child: CommonWidget.imageBuilder(
          imagePath:
              generalSettingModel?.data.splashImage ?? Images.splash_iamge,
        ),
      ),
    );
  }
}
