import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:unk/common/colors.dart';
import 'package:unk/common/common_widget.dart';

import '../controller/homeslider_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeDataController homeDataController = Get.put(
    HomeDataController(),
  );

  final List<String> imgList = [];

  @override
  void initState() {
    homeDataController.gethomeData();
    super.initState();
  }

  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
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
                        const Icon(Icons.star),
                        CommonWidget.commonText(text: "10"),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: EdgeInsets.only(left: 10.r, right: 10.r),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: CommonWidget.commonText(
                        text: "N",
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
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
                      // (homeDataController.homeModel?.data.slider.isEmpty ??
                      //         false)
                      //     ? CommonWidget.sizedBox(isShrink: true)
                      //     : CarouselSlider(
                      //         options: CarouselOptions(
                      //           autoPlay: true,
                      //           aspectRatio: 2.0,
                      //           enlargeCenterPage: true,
                      //         ),
                      //         items: homeDataController.homeModel?.data.slider
                      //             .map(
                      //               (item) => Center(
                      //                 child: CommonWidget.imageBuilder(
                      //                   imagePath: item.imageUrl,
                      //                 ),
                      //               ),
                      //             )
                      //             .toList(),
                      //       ),
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
                      CommonWidget.commonText(
                          text: "Category",
                          color: AppColor.primary1Color,
                          fontSize: 16.sp),
                      CommonWidget.sizedBox(height: 10),
                      (homeDataController.homeModel?.data.category.isEmpty ??
                              false)
                          ? CommonWidget.sizedBox(isShrink: true)
                          : ListView.builder(
                              controller: scrollController,
                              //scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: homeDataController
                                  .homeModel?.data.category.length,
                              itemBuilder: (context, index) {
                                return Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(6),
                                      child: InkWell(
                                        onTap: () {},
                                        child: Container(
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.only(
                                              left: 16.r,
                                              right: 16.r,
                                              bottom: 6.r,
                                              top: 6.r),
                                          decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.black),
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            color: Colors.white,
                                          ),
                                          child: CommonWidget.commonText(
                                              text:
                                                  "${homeDataController.homeModel?.data.category[index].name}",
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                      // Row(
                      //   children: [
                      //     Container(
                      //       alignment: Alignment.center,
                      //       width: 70.w,
                      //       padding: EdgeInsets.only(
                      //           left: 16.r, right: 16.r, bottom: 6.r, top: 6.r),
                      //       decoration: BoxDecoration(
                      //         border: Border.all(color: Colors.black),
                      //         borderRadius: BorderRadius.circular(16),
                      //         color: AppColor.primary1Color,
                      //       ),
                      //       child: CommonWidget.commonText(
                      //           text: "All", color: Colors.white),
                      //     ),
                      //     CommonWidget.sizedBox(width: 5),
                      //     Container(
                      //       alignment: Alignment.center,
                      //       padding: EdgeInsets.only(
                      //           left: 16.r, right: 16.r, bottom: 6.r, top: 6.r),
                      //       decoration: BoxDecoration(
                      //         border: Border.all(color: Colors.black),
                      //         borderRadius: BorderRadius.circular(16),
                      //         color: Colors.white,
                      //       ),
                      //       child: CommonWidget.commonText(
                      //           text: "Funny", color: Colors.black),
                      //     ),
                      //     CommonWidget.sizedBox(width: 5),
                      //     Container(
                      //       alignment: Alignment.center,
                      //       padding: EdgeInsets.only(
                      //           left: 16.r, right: 16.r, bottom: 6.r, top: 6.r),
                      //       decoration: BoxDecoration(
                      //         border: Border.all(color: Colors.black),
                      //         borderRadius: BorderRadius.circular(16),
                      //         color: Colors.white,
                      //       ),
                      //       child: CommonWidget.commonText(
                      //           text: "Entertainment", color: Colors.black),
                      //     ),
                      //   ],
                      // ),
                      CommonWidget.sizedBox(height: 16),
                      (homeDataController
                                  .homeModel?.data.categoryData.isEmpty ??
                              false)
                          ? CommonWidget.sizedBox(isShrink: true)
                          : GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                              ),
                              itemCount: homeDataController
                                  .homeModel?.data.categoryData.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Container(
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
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: CommonWidget.commonText(
                                            maxLines: 10,
                                            text:
                                                "${homeDataController.homeModel?.data.categoryData[index].name}",
                                            color: Colors.black),
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                      // Row(
                      //   children: [
                      //     Container(
                      //       width: 160.w,
                      //       decoration: BoxDecoration(
                      //         color: AppColor.secondery6Color,
                      //         borderRadius: BorderRadius.circular(12),
                      //       ),
                      //       child: Column(
                      //         children: [
                      //           Container(
                      //             height: 120.h,
                      //             decoration: BoxDecoration(
                      //               color: Colors.black,
                      //               borderRadius: BorderRadius.circular(12),
                      //             ),
                      //           ),
                      //           Padding(
                      //             padding: const EdgeInsets.all(8.0),
                      //             child: CommonWidget.commonText(
                      //                 maxLines: 10,
                      //                 text:
                      //                     "New video Avaloable on You Tube Incriment to mind to reward on imagon Tap Ristar on Live...."),
                      //           )
                      //         ],
                      //       ),
                      //     ),
                      //     const Spacer(),
                      //     Container(
                      //       width: 160.w,
                      //       decoration: BoxDecoration(
                      //         color: AppColor.secondery6Color,
                      //         borderRadius: BorderRadius.circular(12),
                      //       ),
                      //       child: Column(
                      //         children: [
                      //           Container(
                      //             height: 120.h,
                      //             decoration: BoxDecoration(
                      //               color: Colors.black,
                      //               borderRadius: BorderRadius.circular(12),
                      //             ),
                      //           ),
                      //           Padding(
                      //             padding: const EdgeInsets.all(8.0),
                      //             child: CommonWidget.commonText(
                      //                 maxLines: 10,
                      //                 text:
                      //                     "New video Avaloable on You Tube Incriment to mind to reward on imagon Tap Ristar on Live...."),
                      //           )
                      //         ],
                      //       ),
                      //     ),
                      //   ],
                      // ),
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
