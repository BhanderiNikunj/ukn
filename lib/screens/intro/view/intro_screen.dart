import 'package:unk/exports.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  late IntroController controller;

  @override
  void initState() {
    controller = Get.put(IntroController());
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary1Color,
      body: GetBuilder(
        init: controller,
        builder: (_) {
          return Column(
            children: [
              Expanded(
                flex: 1,
                child: InkWell(
                  splashFactory: NoSplash.splashFactory,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () => CommonRoute.popAndPushNamed(
                    page: RouteList.login_screen,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16.h),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: CommonWidget.commonText(
                        text: Strings.skip,
                        fontSize: 12,
                        color: AppColor.white1Color,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: PageView.builder(
                  itemCount: controller.listOfIntro.length,
                  onPageChanged: (index) =>
                      controller.changePangeIndex(index: index),
                  itemBuilder: (context, index) {
                    IntroModel introModel = controller.listOfIntro[index];
                    return Column(
                      children: [
                        CommonWidget.imageBuilder(
                          imagePath: introModel.imagePath,
                        ),
                        CommonWidget.sizedBox(height: 110),
                        CommonWidget.commonText(
                          text: introModel.title,
                          color: AppColor.white1Color,
                          fontSize: 14,
                          maxLines: 5,
                          fontWeight: FontWeight.w900,
                        ),
                        CommonWidget.sizedBox(height: 10),
                        CommonWidget.commonText(
                          text: introModel.desc,
                          maxLines: 5,
                          color: AppColor.white1Color,
                          fontSize: 14,
                          fontWeight: FontWeight.w900,
                        ),
                      ],
                    );
                  },
                ),
              ),
              CommonWidget.sizedBox(height: 100),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  children: [
                    Row(
                      children: List.generate(
                        controller.listOfIntro.length,
                        (index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            child: Container(
                              height: 6.h,
                              width: 25.w,
                              decoration: BoxDecoration(
                                color: controller.selectedPageIndex == index
                                    ? AppColor.secondery1Color
                                    : AppColor.white1Color,
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const Spacer(),
                    CommonWidget.commonButton(
                      text: controller.selectedPageIndex ==
                              (controller.listOfIntro.length - 1)
                          ? Strings.login
                          : Strings.next,
                      width: 100,
                      onTap: () {
                        if (controller.selectedPageIndex ==
                            (controller.listOfIntro.length - 1)) {
                          CommonRoute.popAndPushNamed(
                            page: RouteList.login_screen,
                          );
                          return;
                        }
                        controller.changePangeIndex(
                          index: (controller.selectedPageIndex + 1),
                        );
                      },
                    ),
                  ],
                ),
              ),
              CommonWidget.sizedBox(height: 70),
            ],
          );
        },
      ),
    );
  }
}
