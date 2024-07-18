import 'package:unk/screens/language/controller/language_controller.dart';

import '../../../exports.dart';

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
      title: Strings.select_language,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 50),
        child: Column(
          children: [
            GridView.builder(
              shrinkWrap: true,
              itemCount: controller.languageList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 40,
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      height: 100.h,
                      width: 180.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColor.white1Color,
                        boxShadow: [
                          BoxShadow(
                            color: AppColor.primary1Color.withOpacity(0.5),
                            blurRadius: 5.0,
                            offset: const Offset(0, 0),
                            spreadRadius: 0.5,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 35,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      AppColor.primary1Color.withOpacity(0.3),
                                  blurRadius: 3.0,
                                  offset: const Offset(0, 2),
                                  spreadRadius: 0.3,
                                ),
                              ],
                            ),
                            child: CommonWidget.imageBuilder(
                              imagePath: controller.languageList[index].image,
                            ),
                          ),
                          CommonWidget.sizedBox(height: 10),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CommonWidget.commonText(
                                text:
                                    controller.languageList[index].languageName,
                                fontWeight: FontWeight.bold,
                              ),
                              CommonWidget.commonText(
                                text: controller.languageList[index].shortCode,
                                color: AppColor.default3Color,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
            const Spacer(),
            CommonWidget.commonButton(
              text: Strings.continue_button,
              onTap: () {
                CommonRoute.pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
