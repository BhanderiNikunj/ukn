import 'package:flutter_ukn_earning_app/exports.dart';

class UknApp extends StatefulWidget {
  const UknApp({super.key});

  @override
  State<UknApp> createState() => _UknAppState();
}

class _UknAppState extends State<UknApp> {
  @override
  void initState() {
    userDataGet();
    super.initState();
  }

  Future<void> userDataGet() async {
    ApiHelper.getGeneralSettingData();
    int userId = await SharedHelper.getLoginData();
    if (userId != -1) {
      ApiHelper.readUserDataWithLoginId(id: userId);
    }
    String dates = await SharedHelper.getTodayDate();
    if (dates.isNotEmpty) {
      if (dates.split('/').first != DateTime.now().day.toString()) {
        await SharedHelper.setYourScratchList(isScratch: false);
      }
    }
    String languageCode = await SharedHelper.getUserLanguage();
    if (languageCode == "en") {
      loadEnglishLanguage();
    } else if (languageCode == "gu") {
      loadGujaratiLanguage();
    } else if (languageCode == "hi") {
      loadHindiLanguage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        child: GetMaterialApp(
          initialRoute: RouteList.initial,
          getPages: getPages,
        ),
      ),
    );
  }
}
