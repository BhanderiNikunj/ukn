import 'package:url_launcher/url_launcher.dart';

import '../../../exports.dart';

class HelpCenterScreen extends StatefulWidget {
  const HelpCenterScreen({super.key});

  @override
  State<HelpCenterScreen> createState() => _HelpCenterScreenState();
}

class _HelpCenterScreenState extends State<HelpCenterScreen> {
  @override
  Widget build(BuildContext context) {
    return CommonWidget.commonScreenUI(
      title: Strings.support,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CommonWidget.imageBuilder(
              imagePath: Images.person_support_svg,
              height: 150.h,
              width: 150.w,
            ),
            CommonWidget.commonText(
              text: Strings.hello_how_can_we,
              fontSize: 20,
              color: AppColor.primary1Color,
              fontWeight: FontWeight.bold,
            ),
            CommonWidget.commonText(
              text: Strings.help_you,
              fontSize: 20,
              color: AppColor.primary1Color,
              fontWeight: FontWeight.bold,
            ),
            CommonWidget.sizedBox(height: 100.h),
            buttonView(
              title: Strings.live_contact_support,
              onTap: () async {
                final Uri launchUri = Uri(
                  scheme: 'tel',
                  path: '+91 6352431889',
                );
                if (await canLaunchUrl(launchUri)) {
                  await launchUrl(launchUri);
                } else {
                  // Handle the case where the URL cannot be launched.
                  print('Could not launch $launchUri');
                }
              },
              imagePath: Images.customer_support_svg,
            ),
            buttonView(
              title: Strings.sent_us_an_email,
              onTap: () {
                String? encodeQueryParameters(Map<String, String> params) {
                  return params.entries
                      .map((MapEntry<String, String> e) =>
                          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                      .join('&');
                }

                final Uri emailLaunchUri = Uri(
                  scheme: 'mailto',
                  path: 'uknearningapp842@gmail.com',
                  query: encodeQueryParameters(<String, String>{
                    'subject': 'Example Subject & Symbols are allowed!',
                  }),
                );

                launchUrl(emailLaunchUri);
              },
              imagePath: Images.email_svg,
            ),
            buttonView(
              title: Strings.chat_with_us,
              onTap: () {
                CommonRoute.pushNamed(page: RouteList.chat_support_screen);
              },
              imagePath: Images.chat_support_svg,
            ),
          ],
        ),
      ),
    );
  }

  Widget buttonView({
    required title,
    required void Function()? onTap,
    required String imagePath,
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
                spreadRadius: 0.5),
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
