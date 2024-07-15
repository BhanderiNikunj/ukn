import 'dart:io';

import 'package:http/http.dart';
import 'package:unk/exports.dart';

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
File? imageFile;

Future<void> downloadImage() async {
  var tempDir = await getTemporaryDirectory();
  File file = File("${tempDir.path}/image.jpg");
  if (await file.exists()) {
    imageFile = file;
    return;
  }
  if (generalSettingModel != null) {
    try {
      Uri uri = Uri.parse(generalSettingModel!.data.splashImage);
      var response = await get(uri);
      imageFile = file;
      imageFile?.writeAsBytes(response.bodyBytes);
    } catch (error) {
      debugPrint("==================$error");
    }
  }
}
