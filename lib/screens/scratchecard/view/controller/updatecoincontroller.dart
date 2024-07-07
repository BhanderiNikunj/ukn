import 'package:get/get.dart';
import 'package:unk/model/common_model.dart';
import 'package:unk/model/user_data_model.dart';
import 'package:unk/utils/api_helper.dart';

class UserPointUpdate extends GetxController
{
  
 
  int? scratchBoolValue;
  CommonModel? commonModel;
  Future<void> userPointUpdate(userId,coin)
  async {
    commonModel = await ApiHelper.updateScratchPoint(userId,coin);
    update();
  }
}