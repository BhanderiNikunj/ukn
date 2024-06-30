import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unk/common/colors.dart';
import 'package:unk/common/common_widget.dart';
import 'package:unk/common/global.dart';
import 'package:unk/widgets/strings.dart';

class RedeemRewardScreen extends StatefulWidget {
  const RedeemRewardScreen({super.key});

  @override
  State<RedeemRewardScreen> createState() => _RedeemRewardScreenState();
}

class _RedeemRewardScreenState extends State<RedeemRewardScreen> {
  @override
  Widget build(BuildContext context) {
    return CommonWidget.commonScreenUI(
      title: Strings.redeem,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
        child: ListView.builder(
          itemCount: generalSettingModel?.data.redeemRewards.length ?? 0,
          itemBuilder: (context, index) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount:
              generalSettingModel?.data.redeemRewards[index].rewards.length ?? 0,
              itemBuilder: (context, index) {
                return Container(
                  height: 75.h,
                  width: ScreenUtil().screenWidth,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.white1Color,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 40.h,
                            width: 40.w,
                            margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            decoration: BoxDecoration(
                              color: AppColor.white1Color,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 5.0,
                                ),
                              ],
                            ),
                            // child: CommonWidget.imageBuilder(imagePath: ""),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonWidget.commonText(text: Strings.coin),
                              Row(
                                children: [
                                  CommonWidget.commonText(
                                    text: Strings.redeem_reward,
                                  ),
                                  // CommonWidget.commonText(
                                  //   text: generalSettingModel?.data.redeemRewards[index].rewards[index].coin ?? "",
                                  // ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
