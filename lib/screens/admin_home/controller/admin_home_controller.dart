import 'package:flutter_ukn_earning_app/exports.dart';

class AdminHomeController extends GetxController {
  List<AdminOption> listOfAdminOption = [
    AdminOption(
      title: 'User Data',
      route: RouteList.admin_user_data_screen,
      image: Images.user_svg,
    ),
    AdminOption(
      title: 'Chat Support',
      route: '',
      image: Images.chat_support_svg,
    ),
  ];
}

class AdminOption {
  final String title;
  final String route;
  final String image;

  AdminOption({required this.title, required this.route, required this.image});
}
