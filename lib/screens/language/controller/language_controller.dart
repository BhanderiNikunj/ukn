import 'package:unk/exports.dart';
import 'package:unk/screens/language/model/language_model.dart';

class LanguageController extends GetxController {
  String languageCode = "en";

  List<LanguageModel> languageList = [
    LanguageModel(
      id: 1,
      languageName: Strings.english,
      image: Images.flag_united_states_svg,
      shortCode: "en",
    ),
    LanguageModel(
      id: 2,
      languageName: Strings.gujarati,
      image: Images.india_flag_svg,
      shortCode: "gu",
    ),
    LanguageModel(
      id: 2,
      languageName: Strings.hindi,
      image: Images.india_flag_svg,
      shortCode: "hi",
    ),
  ];

  void changeLanguage({required String code}) {
    languageCode = code;
    update();
  }

  void changeAllLanguage() {
    SharedHelper.setUserLanguage(languageCode: languageCode);
    if (languageCode == "en") {
      loadEnglishLanguage();
    } else if (languageCode == "gu") {
      loadGujaratiLanguage();
    } else if (languageCode == "hi") {
      loadHindiLanguage();
    }
    update();
  }
}
