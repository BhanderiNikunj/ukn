import 'package:unk/exports.dart';
import 'package:unk/screens/adminui/adminuserData/view/adminuserdata.dart';
import 'package:unk/screens/adminui/view/adminhomescreen.dart';

List<GetPage> getPages = [
  GetPage(
    name: RouteList.initial,
    page: () => const SplashScreen(),
  ),
  GetPage(
    name: RouteList.login_screen,
    page: () => const LoginScreen(),
  ),
  GetPage(
    name: RouteList.signup_screen,
    page: () => const SignupScreen(),
  ),
  GetPage(
    name: RouteList.home_screen,
    page: () => const HomeScreen(),
  ),
  GetPage(
    name: RouteList.add_user_data_screen,
    page: () => const AddUserDataScreen(),
  ),
  GetPage(
    name: RouteList.reward_history_screen,
    page: () => const RewardHistoryScreen(),
  ),
  GetPage(
    name: RouteList.intro_screen,
    page: () => const IntroScreen(),
  ),
  GetPage(
    name: RouteList.chat_support_screen,
    page: () => const ChatSupportScreen(),
  ),
  GetPage(
    name: RouteList.profile_screen,
    page: () => const ProfileScreen(),
  ),
    GetPage(
    name: RouteList.admin_user_data_screen,
    page: () => const AdminUserData(),
  ),
  GetPage(
    name: RouteList.admin_home_scrren_screen,
    page: () => const AdminHomeScrren(),
  ),
];

GeneralSettingModel? generalSettingModel;
UserData? userData;
