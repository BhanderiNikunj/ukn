import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:unk/common/colors.dart';
import 'package:unk/common/common_widget.dart';
import 'package:unk/screens/home/controller/home_controller.dart';
import 'package:unk/widgets/strings.dart';

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
      titleWidget: const Row(children: []),
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
                  sliderView(),
                  CommonWidget.sizedBox(height: 20),
                  offerView(),
                  CommonWidget.sizedBox(height: 20),
                  CommonWidget.commonText(
                    text: Strings.get_more_coins,
                    fontWeight: FontWeight.w900,
                    fontSize: 16,
                  ),
                  CommonWidget.sizedBox(height: 15),
                  categoryList(),
                  CommonWidget.sizedBox(height: 15),
                  categoryDataList(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget categoryDataList() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      shrinkWrap: true,
      itemCount: controller.categoryData.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: AppColor.secondery6Color,
            borderRadius: BorderRadius.circular(10.r),
          ),
          margin: EdgeInsets.only(bottom: 10.h, right: 10.w),
          child: Stack(
            children: [
                  SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                       child:   Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                          Container(
                            height: 105,
                          ),
                           Text(controller.categoryData[index].name,
                                  //  maxLines: 10,
                                  ),
                         ],
                       ),
                        
                      ),
                    ),
                 
              Column(
                mainAxisSize: MainAxisSize.min,
               // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonWidget.imageBuilder(
                    imagePath: controller.categoryData[index].imageUrl,
                    borderRadius: 10.r,
                    height: 100.h,
                  ),
                ],
              ),
               
            ],
          ),
        );
      },
    );
  }

  Widget categoryList() {
    return Row(
      children: List.generate(
        controller.homeModel?.data.category.length ?? 0,
        (index) {
          var data = controller.homeModel?.data.category[index];
          return Container(
            decoration: BoxDecoration(
              color: controller.selectedCategory == index
                  ? AppColor.primary1Color
                  : AppColor.white1Color,
              border: controller.selectedCategory == index
                  ? null
                  : Border.all(
                      color: AppColor.primary1Color,
                      width: 1.5.w,
                    ),
              borderRadius: BorderRadius.circular(50.r),
            ),
            margin: EdgeInsets.only(right: 10.w),
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 7.h),
            child: CommonWidget.commonText(
              text: data?.name ?? "",
              color: controller.selectedCategory == index
                  ? AppColor.white1Color
                  : AppColor.primary1Color,
            ),
          );
        },
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

  Widget sliderView() {
    return Container(
      height: 160.h,
      width: ScreenUtil().screenWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: CarouselSlider(
        items: List.generate(
          controller.homeModel?.data.slider.length ?? 0,
          (index) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: CommonWidget.imageBuilder(
              imagePath:
                  controller.homeModel?.data.slider[index].imageUrl ?? "",
              borderRadius: 10.r,
              width: ScreenUtil().screenWidth,
            ),
          ),
        ),
        options: CarouselOptions(
          autoPlay: true,
          animateToClosest: true,
          enlargeStrategy: CenterPageEnlargeStrategy.zoom,
          enlargeFactor: 5,
        ),
      ),
    );
  }
}
