import 'package:get/get.dart';
import 'package:unk/model/home_model.dart';
import 'package:unk/utils/api_helper.dart';

class HomeDataController extends GetxController {
  HomeModel? homeModel;
  Future<void> gethomeData() async {
    homeModel = await ApiHelper.getHomeData();
    update();
  }
}
