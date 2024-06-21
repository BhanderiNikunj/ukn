import 'package:get/get.dart';
import 'package:unk/common/route_list.dart';
import 'package:unk/screens/login/view/login_screen.dart';
import 'package:unk/screens/register/view/signup_screen.dart';
import 'package:unk/screens/splash/view/splash_screen.dart';

List<GetPage> getPages = [
  GetPage(name: RouteList.initial, page: () => const SplashScreen()),
  GetPage(name: RouteList.login, page: () => const LoginScreen()),
  GetPage(name: RouteList.signup, page: () => const RegisterScreen()),
];

 String splashImage = "https://homeincomeexpanseapi.000webhostapp.com/ukn_api/images/splash_screen/Splash%20Screen.jpg";
 String appLogo = "https://homeincomeexpanseapi.000webhostapp.com/ukn_api/images/splash_screen/Splash%20Screen.jpg";