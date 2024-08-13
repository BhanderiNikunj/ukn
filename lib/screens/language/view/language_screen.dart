import 'package:flutter_ukn_earning_app/exports.dart';
import 'package:flutter_ukn_earning_app/screens/language/controller/language_controller.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  late LanguageController controller;

  @override
  void initState() {
    controller = Get.put(LanguageController());
    getUserLanguageCode();
    super.initState();
  }

  Future<void> getUserLanguageCode() async {
    String code = await SharedHelper.getUserLanguage();
    controller.languageCode = code;
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
        builder: (_) {
          return CommonWidget.commonScreenUI(
            title: Strings.select_language,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Column(
                children: [
                  GridView.builder(
                    shrinkWrap: true,
                    itemCount: controller.languageList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 20,
                      crossAxisCount: 2,
                      mainAxisExtent: 130,
                    ),
                    itemBuilder: (context, index) {
                      var model = controller.languageList[index];
                      bool isCuttent =
                          controller.languageCode == model.shortCode;
                      return InkWell(
                        onTap: () =>
                            controller.changeLanguage(code: model.shortCode),
                        child: Container(
                          height: 100.h,
                          width: 180.w,
                          margin: EdgeInsets.symmetric(vertical: 10.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColor.white1Color,
                            boxShadow: commonShadow,
                            border: isCuttent
                                ? Border.all(
                                    color: AppColor.primary1Color,
                                    width: 2,
                                  )
                                : null,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CommonWidget.imageBuilder(
                                imagePath: model.image,
                                height: 50,
                              ),
                              CommonWidget.sizedBox(height: 10),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CommonWidget.commonText(
                                    text: model.languageName,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  CommonWidget.commonText(
                                    text: " (${model.shortCode})",
                                    color: AppColor.default3Color,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  const Spacer(),
                  CommonWidget.commonButton(
                    text: Strings.continue_button,
                    onTap: () => controller.changeAllLanguage(),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
