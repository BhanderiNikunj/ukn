import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:unk/common/colors.dart';
import 'package:unk/common/common_widget.dart';
import 'package:unk/common/global.dart';
import 'package:unk/model/general_setting_model.dart';
import 'package:unk/widgets/strings.dart';

class RedeemRewardScreen extends StatefulWidget {
  const RedeemRewardScreen({super.key});

  @override
  State<RedeemRewardScreen> createState() => _RedeemRewardScreenState();
}

class _RedeemRewardScreenState extends State<RedeemRewardScreen> {
  int rewardsIndex = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return CommonWidget.commonScreenUI(
      title: Strings.redeem,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
        child: generalSettingModel != null
            ? ListView.builder(
                shrinkWrap: true,
                itemCount: generalSettingModel!
                    .data.redeemRewards[rewardsIndex].rewards.length,
                itemBuilder: (context, index) {
                  Reward rewards = generalSettingModel!
                      .data.redeemRewards[rewardsIndex].rewards[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      width: ScreenUtil().screenWidth,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColor.white1Color,
                        boxShadow: const [
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
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(8),
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColor.white1Color,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 5.0,
                                    ),
                                  ],
                                ),
                                child: CommonWidget.imageBuilder(
                                  imagePath: generalSettingModel?.data
                                          .redeemRewards[rewardsIndex].image ??
                                      "",
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      CommonWidget.commonText(
                                          text: Strings.redeemCoin),
                                      CommonWidget.commonText(
                                          text: rewards.coin.toString(),
                                          fontWeight: FontWeight.bold),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      CommonWidget.commonText(
                                        text: Strings.redeem_reward,
                                      ),
                                      CommonWidget.commonText(
                                        fontWeight: FontWeight.bold,
                                        text: rewards.money.toString(),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
            : CommonWidget.noDataFound(),
      ),
    );
  }
}
