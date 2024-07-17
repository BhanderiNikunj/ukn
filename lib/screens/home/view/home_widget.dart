import 'package:unk/exports.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class HomeWidget extends State<HomeScreen> {
  late HomeController controller;

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

  Widget screenView() {
    return SingleChildScrollView(
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
    );
  }

  Widget categoryDataList() {
    if (controller.categoryData.isEmpty) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 50.h),
        child: CommonWidget.noDataFound(),
      );
    }
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 0,
        childAspectRatio: 0.95,
      ),
      shrinkWrap: true,
      itemCount: controller.categoryData.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        var data = controller.categoryData[index];
        return InkWell(
          onTap: () async {
            Uri url = Uri.parse(data.videoUrl);
            try {
              await launchUrl(url);
            } catch (error) {
              debugPrint("=================$error");
            }
          },
          child: Container(
            decoration: BoxDecoration(
              color: AppColor.secondery6Color,
              borderRadius: BorderRadius.circular(10.r),
            ),
            margin: EdgeInsets.only(bottom: 10.h, right: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonWidget.imageBuilder(
                  imagePath: data.imageUrl,
                  borderRadius: 10.r,
                  height: 100.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 5.h,
                  ),
                  child: CommonWidget.commonText(
                    text: data.name,
                    maxLines: 2,
                  ),
                ),
              ],
            ),
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
          return InkWell(
            onTap: () => controller.changeCategory(
              index: index,
              category: data,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: controller.selectedCategory == index
                    ? AppColor.primary1Color
                    : AppColor.white1Color,
                border: Border.all(color: AppColor.primary1Color, width: 1.5.w),
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
            ),
          );
        },
      ),
    );
  }

  Widget offerView() {
    var list = controller.homeModel?.data.extraOption;
    return CommonWidget.sizedBox(
      height: 80,
      child: ListView.builder(
        itemCount: list?.length ?? 0,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.only(right: 10.w),
          child: InkWell(
            onTap: () {
              if (list?[index].routeName.isNotEmpty ?? false) {
                CommonRoute.pushNamed(
                  page: list?[index].routeName ?? "",
                );
              }
            },
            child: CommonWidget.imageBuilder(
              imagePath: list?[index].image ?? "",
            ),
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
