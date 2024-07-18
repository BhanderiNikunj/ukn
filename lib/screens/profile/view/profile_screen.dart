import 'package:unk/exports.dart';
import 'package:unk/screens/language/model/language_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    userData;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CommonWidget.commonScreenUI(
          height: 650.h,
          title: Strings.profile_screen,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 110, 16, 20),
            child: Column(
              children: [
                buttonView(
                  onTap: () {
                    CommonRoute.pushNamed(
                        page: RouteList.update_user_data_screen);
                  },
                  title: Strings.edit_profile,
                  imagePath: Images.person_svg,
                ),
                buttonView(
                  onTap: () {
                    CommonRoute.pushNamed(
                        page: RouteList.reward_history_screen);
                  },
                  title: Strings.my_rewards,
                  imagePath: Images.rewards_svg,
                ),
                buttonView(
                  onTap: () {
                    CommonRoute.pushNamed(page: RouteList.redeem_screen);
                  },
                  title: Strings.redeem_now,
                  imagePath: Images.redeem_svg,
                ),
                buttonView(
                  onTap: () {
                    CommonRoute.pushNamed(page: RouteList.language_screen);
                  },
                  title: Strings.languages,
                  imagePath: Images.language_svg,
                  choiceLanguage: Strings.english_en,
                ),
                buttonView(
                  onTap: () {
                    CommonRoute.pushNamed(page: RouteList.terms_and_condition);
                  },
                  title: Strings.terms_condition,
                  imagePath: Images.security_svg,
                ),
                buttonView(
                  onTap: () {
                    CommonRoute.pushNamed(page: RouteList.help_center);
                  },
                  title: Strings.help_center,
                  imagePath: Images.help_svg,
                ),
              ],
            ),
          ),
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
              border: Border.all(
                width: 3,
                color: AppColor.primary1Color,
              ),
            ),
            child: CommonWidget.imageBuilder(
              imagePath: userData?.profilePhoto ?? "",
              // fit: BoxFit.contain,
            ),
          ),
        ),
      ],
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
