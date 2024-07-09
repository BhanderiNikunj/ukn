import 'package:unk/exports.dart';

class RedeemDataScreen extends StatefulWidget {
  const RedeemDataScreen({super.key});

  @override
  State<RedeemDataScreen> createState() => _RedeemDataScreenState();
}

class _RedeemDataScreenState extends State<RedeemDataScreen> {
  int rIndex = Get.arguments;
  RedeemReward? rewards;

  @override
  void initState() {
    rewards = generalSettingModel?.data.redeemRewards[rIndex];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CommonWidget.commonScreenUI(
      title: Strings.redeem_data,
      child: (rewards?.rewards.isEmpty ?? false)
          ? CommonWidget.noDataFound()
          : ListView.builder(
              itemCount: rewards?.rewards.length ?? 0,
              itemBuilder: (context, index) {
                return Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
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
                                    text: "${rewards?.rewards[index].coin}",
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
                                      text: rewards?.rewards[index].money,
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
                      CommonWidget.sizedBox(height: 15),
                      LinearProgressIndicator(
                        borderRadius: BorderRadius.circular(50.r),
                        backgroundColor: AppColor.primary6Color,
                        semanticsValue: "1",
                        valueColor: AlwaysStoppedAnimation<Color>(
                            AppColor.primary1Color),
                        value: (userData?.userPoint.toDouble() ?? 0) /
                            (rewards?.rewards[index].coin.toDouble() ?? 0),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
