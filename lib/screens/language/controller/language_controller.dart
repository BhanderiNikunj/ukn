import 'package:get/get.dart';
import 'package:unk/screens/language/model/language_model.dart';

import '../../../widgets/images.dart';

class LanguageController extends GetxController {
  List<LanguageModel> languageList = [
    LanguageModel(
        id: 1,
        languageName: "Gujarati ",
        image: Images.flag_india_svg,
        shortCode: "(IN)"),
    LanguageModel(
        id: 2,
        languageName: "Hindi ",
        image: Images.flag_india_svg,
        shortCode: "(IN)"),
    LanguageModel(
        id: 3,
        languageName: "English ",
        image: Images.flag_us_svg,
        shortCode: "(US)"),
  ];
}
