import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:unk/common/colors.dart';
import 'package:unk/common/common_widget.dart';
import 'package:unk/screens/reward_history/controller/reward_history_controller.dart';
import 'package:unk/widgets/images.dart';
import 'package:unk/widgets/strings.dart';

class RewardHistoryScreen extends StatefulWidget {
  const RewardHistoryScreen({super.key});

  @override
  State<RewardHistoryScreen> createState() => _RewardHistoryScreenState();
}

class _RewardHistoryScreenState extends State<RewardHistoryScreen> {
  late RewardHistoryController controller;

  @override
  void initState() {
    controller = Get.put(RewardHistoryController());
    super.initState();
  }

  @override 
  void dispose(){
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CommonWidget.commonScreenUI(
      title: Strings.reward_history,
      child: ListView.separated(
        itemCount: 50,
        separatorBuilder: (context, index) {
          if ((index + 1) % 5 == 0) {
            return Container(
              height: 100,
              margin: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 10.h,
              ),
              color: AppColor.default1Color,
              child: FutureBuilder(
                future: controller.loadBannerAd(index: index),
                builder: (context, snapshot) {
                  if (snapshot.data != null) {
                    return AdWidget(ad: snapshot.data!);
                  } else {
                    return CommonWidget.sizedBox(isShrink: true);
                  }
                },
              ),
            );
          }
          return CommonWidget.sizedBox(isShrink: true);
        },
        itemBuilder: (context, index) {
          if (index % 4 == 0) {
            return CommonWidget.sizedBox(isShrink: true);
          }
          return Container(
            height: 100,
            margin: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 10.h,
            ),
            color: AppColor.primary1Color,
            child: Row(
              children: [
                CommonWidget.imageBuilder(
                  imagePath: Images.play_store_png,
                ),
                Column(
                  children: [
                    CommonWidget.commonText(
                      text: 'Google Play Store',
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
