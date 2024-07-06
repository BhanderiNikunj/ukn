import 'package:unk/exports.dart';

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
