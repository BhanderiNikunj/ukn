import 'package:unk/exports.dart';

class IntroController extends GetxController {
  List<IntroModel> listOfIntro = [
    IntroModel(
      title: Strings.intro_title_1,
      desc: Strings.intro_title_desc_1,
      imagePath: Images.intro_1_svg,
    ),
    IntroModel(
      title: Strings.intro_title_2,
      desc: Strings.intro_title_desc_2,
      imagePath: Images.intro_2_svg,
    ),
  ];

  int selectedPageIndex = 0;

  void changePangeIndex({required int index}) {
    selectedPageIndex = index;
    update();
  }
}
