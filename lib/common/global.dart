import 'package:get/get.dart';
import 'package:unk/common/route_list.dart';
import 'package:unk/model/general_setting_model.dart';
import 'package:unk/screens/login/view/login_screen.dart';
import 'package:unk/screens/signup/view/signup_screen.dart';
import 'package:unk/screens/splash/view/splash_screen.dart';

List<GetPage> getPages = [
  GetPage(name: RouteList.initial, page: () => const SplashScreen()),
  GetPage(name: RouteList.login_screen, page: () => const LoginScreen()),
  GetPage(name: RouteList.signup_screen, page: () => const SignupScreen()),
];

GeneralSettingModel? generalSettingModel;
