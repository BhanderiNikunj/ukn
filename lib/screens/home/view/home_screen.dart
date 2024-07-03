import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:unk/common/colors.dart';
import 'package:unk/common/common_widget.dart';
import 'package:unk/screens/home/controller/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeController controller;

  final List<String> imgList = [];

  @override
  void initState() {
    controller = Get.put(HomeController());
    controller.gethomeData();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return CommonWidget.commonScreenUI(
      titleWidget: Row(
        children: [
          Container(
            padding:
                const EdgeInsets.only(left: 12, right: 12, bottom: 8, top: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Colors.black,
              ),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                CommonWidget.commonText(text: "100"),
              ],
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: CommonWidget.commonText(text: "N"),
          )
        ],
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: GetBuilder(
            init: controller,
            builder: (_) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonWidget.sizedBox(height: 15),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.black),
                    ),
                    child: CarouselSlider(
                      items: List.generate(
                        controller.homeModel?.data.slider.length ?? 0,
                        (index) => CommonWidget.imageBuilder(
                          imagePath: controller
                                  .homeModel?.data.slider[index].imageUrl ??
                              "",
                        ),
                      ),
                      options: CarouselOptions(
                        autoPlay: true,
                        height: 160.h,
                        enlargeFactor: 5,
                      ),
                    ),
                  ),
                  CommonWidget.sizedBox(height: 18),
                  offerView(),
                  // CommonWidget.sizedBox(height: 15),
                  // Container(
                  //   padding: EdgeInsets.only(left: 12.r, right: 12.r),
                  //   height: 50.h,
                  //   width: double.infinity,
                  //   decoration: BoxDecoration(
                  //     color: const Color(0xff402A6A),
                  //     borderRadius: BorderRadius.circular(10.r),
                  //   ),
                  //   child: Row(
                  //     children: [
                  //       CommonWidget.commonText(
                  //         text: "Redeem Your Coin",
                  //         color: Colors.white,
                  //       ),
                  //       const Spacer(),
                  //       const Icon(
                  //         Icons.arrow_circle_right_outlined,
                  //         color: Colors.white,
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // CommonWidget.sizedBox(height: 10),
                  // Container(
                  //   padding: EdgeInsets.only(left: 12.r, right: 12.r),
                  //   height: 50.h,
                  //   width: double.infinity,
                  //   decoration: BoxDecoration(
                  //     color: const Color(0xffF7BB75),
                  //     borderRadius: BorderRadius.circular(10.r),
                  //   ),
                  //   child: Row(
                  //     children: [
                  //       CommonWidget.commonText(
                  //         text: "Spin And Win More Coin",
                  //         color: Colors.black,
                  //       ),
                  //       const Spacer(),
                  //       const Icon(
                  //         Icons.arrow_circle_right_outlined,
                  //         color: Colors.black,
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // CommonWidget.sizedBox(height: 10),
                  // Container(
                  //   padding: EdgeInsets.only(left: 12.r, right: 12.r),
                  //   height: 50.h,
                  //   width: double.infinity,
                  //   decoration: BoxDecoration(
                  //     color: const Color(0xff7C0724),
                  //     borderRadius: BorderRadius.circular(10.r),
                  //   ),
                  //   child: Row(
                  //     children: [
                  //       CommonWidget.commonText(
                  //         text: "Scratch Card And Win Coin",
                  //         color: Colors.white,
                  //       ),
                  //       const Spacer(),
                  //       const Icon(
                  //         Icons.arrow_circle_right_outlined,
                  //         color: Colors.white,
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // CommonWidget.sizedBox(height: 18),
                  // CommonWidget.commonText(
                  //   text: Strings.category,
                  // ),
                  // CommonWidget.sizedBox(height: 18),
                  // CommonWidget.sizedBox(height: 15),
                  // CommonWidget.sizedBox(height: 14),
                  // CommonWidget.commonText(
                  //   text: "Get More Coin",
                  //   color: AppColor.primary1Color,
                  //   fontSize: 16,
                  // ),
                  // CommonWidget.sizedBox(height: 10),
                  // CommonWidget.sizedBox(
                  //   height: 25,
                  //   child: ListView.builder(
                  //     itemCount:
                  //         controller.homeModel?.data.category.length ?? 0,
                  //     shrinkWrap: true,
                  //     scrollDirection: Axis.horizontal,
                  //     itemBuilder: (context, index) {
                  //       return InkWell(
                  //         onTap: () => controller.changeCategory(
                  //           category:
                  //               controller.homeModel?.data.category[index],
                  //           index: index,
                  //         ),
                  //         child: Container(
                  //           height: 25,
                  //           padding: EdgeInsets.symmetric(horizontal: 20.w),
                  //           margin: EdgeInsets.symmetric(horizontal: 5.w),
                  //           decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(50.r),
                  //             border: controller.selectedCategory == index
                  //                 ? null
                  //                 : Border.all(color: AppColor.primary1Color),
                  //             color: controller.selectedCategory == index
                  //                 ? AppColor.primary1Color
                  //                 : AppColor.white1Color,
                  //           ),
                  //           alignment: Alignment.center,
                  //           child: CommonWidget.commonText(
                  //             text: controller
                  //                     .homeModel?.data.category[index].name ??
                  //                 "",
                  //             color: controller.selectedCategory == index
                  //                 ? AppColor.white1Color
                  //                 : AppColor.primary1Color,
                  //             fontSize: 13,
                  //           ),
                  //         ),
                  //       );
                  //     },
                  //   ),
                  // ),
                  // CommonWidget.sizedBox(height: 10),
                  // Container(
                  //   padding: const EdgeInsets.all(8),
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(12),
                  //     border: Border.all(
                  //       color: Colors.black,
                  //     ),
                  //   ),
                  //   child: ListView.builder(
                  //     shrinkWrap: true,
                  //     physics: const NeverScrollableScrollPhysics(),
                  //     // gridDelegate:
                  //     //     const SliverGridDelegateWithFixedCrossAxisCount(
                  //     //   crossAxisCount: 2,
                  //     // ),
                  //     itemCount: controller.categoryData.length,
                  //     itemBuilder: (context, index) {
                  //       return InkWell(
                  //         onTap: () async {
                  //           var url =
                  //               '${controller.categoryData[index].videoUrl}';
                  //           if (await canLaunch(url)) {
                  //             await launch(url);
                  //           } else {
                  //             throw 'Could not launch $url';
                  //           }
                  //         },
                  //         child: Container(
                  //           margin: const EdgeInsets.all(12),
                  //           decoration: BoxDecoration(
                  //             color: AppColor.secondery6Color,
                  //             borderRadius: BorderRadius.circular(12),
                  //             border: Border.all(
                  //               color: Colors.black,
                  //             ),
                  //           ),
                  //           padding: const EdgeInsets.all(8),
                  //           child: SingleChildScrollView(
                  //             child: Column(
                  //               crossAxisAlignment: CrossAxisAlignment.start,
                  //               children: [
                  //                 Container(
                  //                   decoration: BoxDecoration(
                  //                     borderRadius: BorderRadius.circular(12),
                  //                     border: Border.all(
                  //                       color: Colors.black,
                  //                     ),
                  //                   ),
                  //                   child: CommonWidget.imageBuilder(
                  //                     imagePath: controller
                  //                         .categoryData[index].imageUrl,
                  //                   ),
                  //                 ),
                  //                 CommonWidget.sizedBox(height: 8),
                  //                 Text(
                  //                   controller.categoryData[index].name,
                  //                   style: const TextStyle(
                  //                     color: Colors.black,
                  //                     fontWeight: FontWeight.bold,
                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //         ),
                  //       );
                  //     },
                  //   ),
                  // ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget offerView() {
    return CommonWidget.sizedBox(
      height: 80,
      child: ListView.builder(
        itemCount: controller.offerListData.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.only(right: 10.w),
          child: CommonWidget.imageBuilder(
            imagePath: controller.offerListData[index],
          ),
        ),
      ),
    );
  }
}
