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
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
        child: Column(
          children: [
            GridView.builder(
              shrinkWrap: true,
              itemCount: controller.languageList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      height: 100.h,
                      width: 180.w,
                      margin: const EdgeInsets.all(20),
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
                          CommonWidget.imageBuilder(
                            imagePath: controller.languageList[index].image,
                            width: 40,
                            height: 40,
                          ),
                          CommonWidget.sizedBox(height: 5),
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
                                fontWeight: FontWeight.bold,
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
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
