import 'package:get/get.dart';
import 'package:unk/screens/language/model/language_model.dart';

import '../../../widgets/images.dart';

class LanguageController extends GetxController {
  List<LanguageModel> languageList = [
    LanguageModel(
      id: 1,
      languageName: "Gujarati ",
      image: Images.india_flag_svg,
      shortCode: "(IN)",
    ),
    LanguageModel(
      id: 2,
      languageName: "Hindi ",
      image: Images.india_flag_svg,
      shortCode: "(IN)",
    ),
    LanguageModel(
      id: 3,
      languageName: "English ",
      image: Images.flag_united_states_svg,
      shortCode: "(EN)",
    ),
  ];
}
