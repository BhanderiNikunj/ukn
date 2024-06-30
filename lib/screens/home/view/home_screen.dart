// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
// import 'package:unk/common/common_widget.dart';
// import 'package:unk/screens/home/controller/home_controller.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   late HomeController controller;

//   @override
//   void initState() {
//     controller = Get.put(HomeController());
//     controller.loadBannerAdMob();
//     controller.loadBannerAdx();
//     super.initState();
//   }

//   @override
//   void dispose() {
//     controller.bannerAdMob?.dispose();
//     controller.bannerAdX?.dispose();
//     controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               CommonWidget.commonButton(
//                 text: "Adx Interstitial",
//                 width: 150,
//                 onTap: () {
//                   controller.loadInterstitialAdx();
//                 },
//               ),
//               CommonWidget.sizedBox(height: 10),
//               CommonWidget.commonButton(
//                 text: "AdMob Interstitial",
//                 width: 150,
//                 onTap: () {
//                   controller.loadInterstitialAdMob();
//                 },
//               ),
//               CommonWidget.sizedBox(height: 10),
//               CommonWidget.commonButton(
//                 text: "Adx Reward",
//                 width: 150,
//                 onTap: () {
//                   controller.loadRewardAdx();
//                 },
//               ),
//               CommonWidget.sizedBox(height: 10),
//               CommonWidget.commonButton(
//                 text: "AdMob Reward",
//                 width: 150,
//                 onTap: () {
//                   controller.loadRewardAdMob();
//                 },
//               ),
//               CommonWidget.sizedBox(height: 10),
//               CommonWidget.commonButton(
//                 text: "Adx Banner",
//                 width: 150,
//                 onTap: () {
//                   controller.loadBannerAdx();
//                 },
//               ),
//               CommonWidget.sizedBox(height: 10),
//               CommonWidget.commonButton(
//                 text: "AdMob Banner",
//                 width: 150,
//                 onTap: () {
//                   controller.loadBannerAdMob();
//                 },
//               ),
//             ],
//           ),
//         ),
//         bottomNavigationBar: GetBuilder(
//           init: controller,
//           builder: (_) {
//             return CommonWidget.sizedBox(
//               height: 120,
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   controller.bannerAdMob != null
//                       ? CommonWidget.sizedBox(
//                           height: 50,
//                           child: AdWidget(ad: controller.bannerAdMob!),
//                         )
//                       : CommonWidget.sizedBox(isShrink: true),
//                   CommonWidget.sizedBox(height: 10),
//                   controller.bannerAdX != null
//                       ? CommonWidget.sizedBox(
//                           height: 50,
//                           child: AdWidget(ad: controller.bannerAdX!),
//                         )
//                       : CommonWidget.sizedBox(isShrink: true),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unk/common/colors.dart';
import 'package:unk/common/common_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColor.primary1Color,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              //  alignment: Alignment.center,
              padding: EdgeInsets.all(12),
              height: 500,
              width: double.infinity,
              color: AppColor.primary1Color,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10.r, right: 10.r),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    width: 70.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.star),
                        CommonWidget.commonText(text: "10"),
                      ],
                    ),
                  ),
                  Spacer(),
                   Container(
                    padding: EdgeInsets.only(left: 10.r, right: 10.r),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: CommonWidget.commonText(text: "N",color: Colors.black,fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.r),
                    topRight: Radius.circular(20.r),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        height: 180.r,
                        width: double.infinity,
                      ),
                      CommonWidget.sizedBox(height: 20),
                      CommonWidget.commonText(
                          text: "Get More Coin",
                          color: AppColor.primary1Color,
                          fontSize: 16.sp),
                      CommonWidget.sizedBox(height: 18),
                      CommonWidget.commonContainer(
                        padding: EdgeInsets.only(left: 12.r, right: 12.r),
                        height: 50.h,
                        width: double.infinity,
                        color: const Color(0xff402A6A),
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CommonWidget.commonText(
                              text: "Redeem Your Coin",
                              color: Colors.white,
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.arrow_circle_right_outlined,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                      CommonWidget.sizedBox(height: 10),
                      CommonWidget.commonContainer(
                        padding: EdgeInsets.only(left: 12.r, right: 12.r),
                        height: 50.h,
                        width: double.infinity,
                        color: const Color(0xffF7BB75),
                        child: Row(
                          children: [
                            CommonWidget.commonText(
                              text: "Spin And Win More Coin",
                              color: Colors.black,
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.arrow_circle_right_outlined,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                      CommonWidget.sizedBox(height: 10),
                      CommonWidget.commonContainer(
                        padding: EdgeInsets.only(left: 12.r, right: 12.r),
                        height: 50.h,
                        width: double.infinity,
                        color: const Color(0xff7C0724),
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CommonWidget.commonText(
                              text: "Scratch Card And Win Coin",
                              color: Colors.white,
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.arrow_circle_right_outlined,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                       CommonWidget.sizedBox(height: 20),
                      CommonWidget.commonText(text: "Category",color: AppColor.primary1Color,fontSize: 16.sp),
                       CommonWidget.sizedBox(height: 10),
                       Row(
                         children: [
                           Container(
                            alignment: Alignment.center,
                            width: 70.w,
                            padding: EdgeInsets.only(left: 16.r,right: 16.r,bottom: 6.r,top: 6.r),
                            decoration: BoxDecoration(
                                border: Border.all(
                                color: Colors.black
                              ),
                              borderRadius: BorderRadius.circular(16),
                              color: AppColor.primary1Color,
                            ),
                            child: CommonWidget.commonText(text: "All",color: Colors.white),
                           ),
                           CommonWidget.sizedBox(width: 5),
                             Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(left: 16.r,right: 16.r,bottom: 6.r,top: 6.r),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black
                              ),
                              borderRadius: BorderRadius.circular(16),
                               color:Colors.white,
                            ),
                            child: CommonWidget.commonText(text: "Funny",color: Colors.black),
                           ),
                             CommonWidget.sizedBox(width: 5),
                             Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(left: 16.r,right: 16.r,bottom: 6.r,top: 6.r),
                            decoration: BoxDecoration(
                                border: Border.all(
                                color: Colors.black
                              ),
                              borderRadius: BorderRadius.circular(16),
                              color:Colors.white,
                            ),
                            child: CommonWidget.commonText(text: "Entertainment",color: Colors.black),
                           ),
                         ],
                       ),
                       CommonWidget.sizedBox(height: 16),
                       Row(
                         children: [
                           Container(
                            width: 160.w,
                            decoration: BoxDecoration(
                               color: AppColor.secondery6Color,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: 120.h,
                                   decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(12),
                            ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CommonWidget.commonText(maxLines: 10,text: "New video Avaloable on You Tube Incriment to mind to reward on imagon Tap Ristar on Live...."),
                                )
                              ],
                            ),
                             ),
                             Spacer(),
                             Container(
                        width: 160.w,
                        decoration: BoxDecoration(
                           color: AppColor.secondery6Color,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: 120.h,
                               decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(12),
                        ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CommonWidget.commonText(maxLines: 10,text: "New video Avaloable on You Tube Incriment to mind to reward on imagon Tap Ristar on Live...."),
                            )
                          ],
                        ),
                         ),
                         ],
                       ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
