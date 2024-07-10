import 'package:unk/exports.dart';
import 'package:unk/screens/scratch_card/view/scratch_card_screen.dart';

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
    name: RouteList.scratch_card_screen,
    page: () => const ScratchCardScreen(),
  ),
  GetPage(
    name: RouteList.profile_screen,
    page: () => const ProfileScreen(),
  ),
  GetPage(
    name: RouteList.redeem_screen,
    page: () => const RedeemScreen(),
  ),
  GetPage(
    name: RouteList.redeem_data_screen,
    page: () => const RedeemDataScreen(),
  ),
];

GeneralSettingModel? generalSettingModel;
UserData? userData;
