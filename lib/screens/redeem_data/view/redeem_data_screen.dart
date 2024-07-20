import 'package:unk/exports.dart';

class RedeemDataScreen extends StatefulWidget {
  const RedeemDataScreen({super.key});

  @override
  State<RedeemDataScreen> createState() => _RedeemDataScreenState();
}

class _RedeemDataScreenState extends State<RedeemDataScreen> {
  int rIndex = Get.arguments;
  RedeemReward? rewards;
  late RedeemDataController controller;

  @override
  void initState() {
    controller = Get.put(RedeemDataController());
    rewards = generalSettingModel?.data.redeemRewards[rIndex];
    controller.loadBannerAd();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CommonWidget.commonScreenUI(
      title: Strings.redeem_data,
      child: screenView(),
      bottomNavigationBar: adsView(),
    );
  }

  Widget adsView() {
    return Container(
      height: 100.h,
      width: ScreenUtil().screenWidth,
      alignment: Alignment.center,
      child: controller.bannerAd != null
          ? AdWidget(ad: controller.bannerAd!)
          : CommonWidget.commonText(text: Strings.ad_not_load),
    );
  }

  Widget screenView() {
    if (rewards?.rewards.isEmpty ?? false) {
      return CommonWidget.noDataFound();
    }
    return ListView.builder(
      itemCount: rewards?.rewards.length ?? 0,
      itemBuilder: (context, index) {
        return InkWell(
          child: commonDataView(index: index),
        );
      },
    );
  }

  Widget commonDataView({required int index}) {
    Reward reward = rewards?.rewards[index] ?? Reward(coin: 0, money: 0);
    return GetBuilder(
      init: controller,
      builder: (_) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 50.h,
                    width: 50.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: AppColor.white1Color,
                      boxShadow: [
                        BoxShadow(
                          color: AppColor.primary6Color,
                          blurRadius: 5,
                          spreadRadius: 0,
                          offset: Offset(0.w, 0.h),
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    child: CommonWidget.imageBuilder(
                      imagePath: rewards?.image ?? "",
                      height: 35.h,
                    ),
                  ),
                  CommonWidget.sizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CommonWidget.commonText(
                            text: "${Strings.coin} :- ",
                            fontSize: 14,
                          ),
                          CommonWidget.commonText(
                            text: "${reward.coin}",
                            fontWeight: FontWeight.w900,
                            fontSize: 14,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          CommonWidget.commonText(
                            text: "${Strings.redeem_reward} :- ",
                            fontSize: 14,
                          ),
                          CommonWidget.commonText(
                            text: CommonWidget.stringToRupee(
                              text: reward.money,
                            ),
                            fontWeight: FontWeight.w900,
                            fontSize: 14,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              CommonWidget.sizedBox(height: 10),
              LinearProgressIndicator(
                borderRadius: BorderRadius.circular(50.r),
                backgroundColor: AppColor.primary6Color,
                semanticsValue: "1",
                minHeight: 5,
                valueColor:
                    AlwaysStoppedAnimation<Color>(AppColor.primary1Color),
                value: (userData?.userPoint.toDouble() ?? 0) /
                    (reward.coin.toDouble()),
              ),
              CommonWidget.sizedBox(height: 10),
              (userData?.userPoint ?? 0) > reward.coin
                  ? CommonWidget.commonButton(
                      text: Strings.redeem,
                      onTap: () async {
                        if ((userData?.userPoint ?? 0) > reward.coin) {
                          userData!.userPoint -= reward.coin;
                          await controller.addRewardHistory(
                            price: reward.money.toString(),
                            coin: reward.coin.toString(),
                            context: context,
                          );
                          return;
                        }
                      },
                    )
                  : CommonWidget.sizedBox(isShrink: true),
            ],
          ),
        );
      },
    );
  }
}
