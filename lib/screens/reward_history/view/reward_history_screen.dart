import 'package:unk/exports.dart';

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
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CommonWidget.commonScreenUI(
      title: Strings.reward_history,
      child: ListView.separated(
        itemCount: 50,
        physics: const BouncingScrollPhysics(),
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
          if ((index + 1) % 5 == 0) {
            return CommonWidget.sizedBox(isShrink: true);
          }
          return Container(
            margin: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 10.h,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 8.w,
              vertical: 9.h,
            ),
            decoration: BoxDecoration(
              color: AppColor.white1Color,
              borderRadius: BorderRadius.circular(10.r),
              boxShadow: [
                BoxShadow(
                  blurRadius: 5,
                  spreadRadius: 0,
                  color: AppColor.primary6Color,
                  offset: Offset(0.w, 0.h),
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CommonWidget.imageBuilder(
                  imagePath: Images.play_store_png,
                ),
                CommonWidget.sizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonWidget.commonText(
                      text: 'Google Play Store',
                      color: AppColor.primary1Color,
                    ),
                    CommonWidget.commonText(
                      text: CommonWidget.stringToRupee(text: '50'),
                      color: AppColor.primary1Color,
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
