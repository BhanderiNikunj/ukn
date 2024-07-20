import 'package:unk/exports.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  BannerAd? bannerAd;

  Future<void> loadBannerAd() async {
    bannerAd = await AdsHelper.loadBannerAd(
      adType: AdType.admob,
      size: AdSize.banner,
    );
  }

  @override
  void initState() {
    loadBannerAd();
    loadLanguage();
    super.initState();
  }

  String languageCode = "";

  Future<void> loadLanguage() async {
    languageCode = await SharedHelper.getUserLanguage();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CommonWidget.commonScreenUI(
          height: ScreenUtil().screenHeight * 0.8,
          title: Strings.profile_screen,
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 80),
            child: Column(
              children: [
                CommonWidget.commonText(
                  text: "${userData?.firstName} ${userData?.lastName}",
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
                CommonWidget.sizedBox(height: 30),
                buttonView(
                  onTap: () async {
                    await CommonRoute.pushNamed(
                      page: RouteList.update_user_data_screen,
                    );
                    setState(() {});
                  },
                  title: Strings.edit_profile,
                  imagePath: Images.person_svg,
                ),
                buttonView(
                  onTap: () async {
                    await AdsHelper.loadInterstitialAd(adType: AdType.admob);
                    await CommonRoute.pushNamed(
                      page: RouteList.reward_history_screen,
                    );
                  },
                  title: Strings.my_rewards,
                  imagePath: Images.rewards_svg,
                ),
                buttonView(
                  onTap: () async {
                    AdsHelper.loadInterstitialAd(adType: AdType.admob);
                    await CommonRoute.pushNamed(
                      page: RouteList.redeem_screen,
                    );
                    setState(() {});
                  },
                  title: Strings.redeem_now,
                  imagePath: Images.redeem_svg,
                ),
                buttonView(
                  onTap: () async {
                    await CommonRoute.pushNamed(
                      page: RouteList.language_screen,
                    );
                    await loadLanguage();
                  },
                  title: Strings.languages,
                  imagePath: Images.language_svg,
                  choiceLanguage: languageCode == "en"
                      ? "${Strings.english} (EN)"
                      : languageCode == "gu"
                          ? "${Strings.gujarati} (GU)"
                          : languageCode == "hi"
                              ? "${Strings.hindi} (HI)"
                              : "",
                ),
                buttonView(
                  onTap: () async => await CommonRoute.pushNamed(
                    page: RouteList.terms_and_condition_screen,
                  ),
                  title: Strings.terms_condition,
                  imagePath: Images.security_svg,
                ),
                buttonView(
                  onTap: () {
                    CommonRoute.pushNamed(
                      page: RouteList.help_center,
                    );
                  },
                  title: Strings.help_center,
                  imagePath: Images.help_svg,
                ),
              ],
            ),
          ),
          bottomNavigationBar: adsView(),
        ),
        Positioned(
          left: 140,
          top: 80,
          child: Container(
            height: 112.h,
            width: 112.w,
            decoration: BoxDecoration(
              color: AppColor.white1Color,
              shape: BoxShape.circle,
              border: Border.all(width: 3, color: AppColor.primary1Color),
            ),
            alignment: Alignment.center,
            child: CommonWidget.imageBuilder(
              imagePath: userData?.profilePhoto ?? "",
              height: 80,
            ),
          ),
        ),
      ],
    );
  }

  Widget adsView() {
    return Container(
      height: 50.h,
      width: ScreenUtil().screenWidth,
      alignment: Alignment.center,
      child: bannerAd != null
          ? AdWidget(ad: bannerAd!)
          : CommonWidget.commonText(text: Strings.ad_not_load),
    );
  }

  Widget buttonView({
    required title,
    required void Function()? onTap,
    required String imagePath,
    choiceLanguage,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50.h,
        alignment: Alignment.center,
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: AppColor.white1Color,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: AppColor.primary1Color.withOpacity(0.5),
              blurRadius: 5.0,
              offset: const Offset(0, 0),
              spreadRadius: 0.5,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children: [
              CommonWidget.imageBuilder(
                imagePath: imagePath,
              ),
              CommonWidget.sizedBox(width: 10.w),
              CommonWidget.commonText(text: title, fontWeight: FontWeight.bold),
              const Spacer(),
              CommonWidget.commonText(
                  text: choiceLanguage ?? "",
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
              CommonWidget.imageBuilder(
                color: AppColor.primary1Color,
                imagePath: Images.next_arrow_svg,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
