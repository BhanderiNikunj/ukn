import 'package:unk/exports.dart';

class RedeemScreen extends StatefulWidget {
  const RedeemScreen({super.key});

  @override
  State<RedeemScreen> createState() => _RedeemScreenState();
}

class _RedeemScreenState extends State<RedeemScreen> {
  late RedeemController controller;
  BannerAd? bannerAd;

  @override
  void initState() {
    controller = Get.put(RedeemController());
    controller.loadRedeemData();
    loadBannerAd();
    super.initState();
  }

  Future<void> loadBannerAd() async {
    bannerAd = await AdsHelper.loadBannerAd(
      adType: AdType.admob,
      size: AdSize.largeBanner,
    );
    controller.update();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      builder: (context) {
        return CommonWidget.commonScreenUI(
          title: Strings.redeem,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonWidget.sizedBox(height: 10),
                coinView(),
                CommonWidget.sizedBox(height: 15),
                myRewardButton(),
                CommonWidget.sizedBox(height: 15),
                CommonWidget.commonText(
                  text: Strings.redeem_rewards_via,
                  color: AppColor.primary1Color,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
                CommonWidget.sizedBox(height: 15),
                dataListView(),
              ],
            ),
          ),
          bottomNavigationBar: adsView(),
        );
      },
    );
  }

  Widget adsView() {
    return Container(
      height: 100.h,
      width: ScreenUtil().screenWidth,
      alignment: Alignment.center,
      child: bannerAd != null
          ? AdWidget(ad: bannerAd!)
          : CommonWidget.commonText(text: Strings.ad_not_load),
    );
  }

  Widget dataListView() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: controller.listOfRedeemReward.length,
      itemBuilder: (context, index) {
        var redeem = controller.listOfRedeemReward[index];
        return InkWell(
          onTap: () async {
            await CommonRoute.pushNamed(
              page: RouteList.redeem_data_screen,
              arguments: index,
            );
            controller.update();
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            margin: EdgeInsets.symmetric(vertical: 10.h),
            child: Row(
              children: [
                Container(
                  height: 50.h,
                  width: 50.h,
                  alignment: Alignment.center,
                  child: CommonWidget.imageBuilder(
                    imagePath: redeem.image,
                    height: 50,
                  ),
                ),
                CommonWidget.sizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonWidget.commonText(
                      text: redeem.name,
                      fontWeight: FontWeight.bold,
                      color: AppColor.primary1Color,
                    ),
                    CommonWidget.sizedBox(height: 5),
                    CommonWidget.commonText(
                      text: redeem.desc,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColor.primary4Color,
                    ),
                  ],
                ),
                const Spacer(),
                CommonWidget.imageBuilder(
                  imagePath: Images.next_arrow_svg,
                  color: AppColor.primary1Color,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget myRewardButton() {
    return InkWell(
      onTap: () => CommonRoute.pushNamed(
        page: RouteList.reward_history_screen,
      ),
      child: Container(
        width: ScreenUtil().screenWidth,
        height: 60.h,
        decoration: BoxDecoration(
          border: Border.all(color: AppColor.primary1Color, width: 2.h),
          borderRadius: BorderRadius.circular(10.r),
        ),
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          children: [
            CommonWidget.commonText(
              text: Strings.my_rewards,
              color: AppColor.primary1Color,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            const Spacer(),
            CommonWidget.imageBuilder(
              imagePath: Images.next_arrow_svg,
              color: AppColor.primary1Color,
            ),
          ],
        ),
      ),
    );
  }

  Widget coinView() {
    return Container(
      width: ScreenUtil().screenWidth,
      height: 60.h,
      decoration: BoxDecoration(
        color: AppColor.primary1Color,
        borderRadius: BorderRadius.circular(10.r),
      ),
      alignment: Alignment.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CommonWidget.sizedBox(width: 20),
          CommonWidget.commonText(
            text: userData?.userPoint.toString() ?? "",
            color: AppColor.white1Color,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          CommonWidget.sizedBox(width: 5),
          CommonWidget.commonText(
            text: Strings.coin,
            color: AppColor.white1Color,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }
}
