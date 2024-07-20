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
    await Future.delayed(
      Duration(seconds: splashDuration),
      () async {
        bool isLogin = await SharedHelper.getLoginValue();
        if (isLogin) {
          if (await SharedHelper.getAdminLogin()) {
            CommonRoute.popAndPushNamed(page: RouteList.admin_home_screen);
          } else {
            CommonRoute.popAndPushNamed(page: RouteList.home_screen);
          }
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
        child: imageFile != null
            ? CommonWidget.imageBuilder(imagePath: imageFile!.path)
            : CommonWidget.imageBuilder(
                imagePath: generalSettingModel?.data.splashImage ??
                    Images.splash_iamge,
              ),
      ),
    );
  }
}
