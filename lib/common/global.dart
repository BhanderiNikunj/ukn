import 'package:get/get.dart';
import 'package:unk/common/route_list.dart';
import 'package:unk/screens/splash_screem/view/splash_screen.dart';

List<GetPage> getPages = [
  GetPage(name: RouteList.initial, page: () => const SplashScreen()),
];
