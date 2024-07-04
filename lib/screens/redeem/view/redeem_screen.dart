import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unk/common/colors.dart';
import 'package:unk/common/common_router.dart';
import 'package:unk/common/common_widget.dart';
import 'package:unk/common/global.dart';
import 'package:unk/common/route_list.dart';
import 'package:unk/widgets/images.dart';
import 'package:unk/widgets/strings.dart';

class RedeemScreen extends StatefulWidget {
  const RedeemScreen({super.key});

  @override
  State<RedeemScreen> createState() => _RedeemScreenState();
}

class _RedeemScreenState extends State<RedeemScreen> {
  @override
  Widget build(BuildContext context) {
    return CommonWidget.commonScreenUI(
      title: Strings.redeem,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: ScreenUtil().screenWidth,
              height: 50.h,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.center,
                  colors: [
                    AppColor.gradientColor1,
                    AppColor.primary1Color,
                  ],
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  CommonWidget.commonText(
                    text: Strings.coin_number,
                    fontSize: 24.sp,
                    color: AppColor.white1Color,
                  ),
                  CommonWidget.commonText(
                      text: Strings.coin, color: AppColor.white1Color),
                ],
              ),
            ),
            CommonWidget.sizedBox(height: 20),
            Container(
              height: 50.h,
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 1,
                  color: AppColor.borderColor,
                ),
              ),
              width: ScreenUtil().screenWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonWidget.commonText(
                    text: Strings.my_rewards,
                    color: AppColor.primary1Color,
                  ),
                  CommonWidget.imageBuilder(
                    imagePath: Images.next_arrow_svg,
                    width: 20.w,
                    height: 20.h,
                  ),
                ],
              ),
            ),
            CommonWidget.sizedBox(height: 20),
            CommonWidget.commonText(
              text: Strings.redeem_rewards_via,
              color: AppColor.primary1Color,
            ),
            CommonWidget.sizedBox(height: 30),
            ListView.builder(
              shrinkWrap: true,
              itemCount: generalSettingModel?.data.redeemRewards.length ?? 0,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: InkWell(
                    onTap: () {
                      CommonRoute.pushNamed(
                        page: RouteList.redeem_reward_screen,
                        arguments: index,
                      );
                    },
                    child: Container(
                      height: 70.h,
                      width: ScreenUtil().screenWidth,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 55.w,
                                height: 55.h,
                                child: CommonWidget.imageBuilder(
                                  imagePath: generalSettingModel
                                          ?.data.redeemRewards[index].image ??
                                      "",
                                ),
                              ),
                              CommonWidget.sizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CommonWidget.commonText(
                                    text: generalSettingModel
                                            ?.data.redeemRewards[index].name ??
                                        "",
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.primary1Color,
                                  ),
                                  CommonWidget.commonText(
                                    text: generalSettingModel
                                            ?.data.redeemRewards[index].desc ??
                                        "",
                                    color: AppColor.primary4Color,
                                  ),
                                ],
                              ),
                              const Spacer(),
                              CommonWidget.imageBuilder(
                                imagePath: Images.next_arrow_svg,
                                width: 16.w,
                                height: 16.h,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
