import 'package:flutter/material.dart';
import 'package:unk/common/colors.dart';
import 'package:unk/common/common_router.dart';
import 'package:unk/common/common_widget.dart';
import 'package:unk/common/global.dart';
import 'package:unk/common/route_list.dart';
import 'package:unk/widgets/strings.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            Center(
              child: CommonWidget.imageBuilder(
                height: double.infinity,
                width: double.infinity,
                imagePath: splashImage,
              ),
            ),
            Positioned(
              top: 40,
              child: CommonWidget.imageBuilder(
                height: 120,
                width: 120,
                imagePath: appLogo,
              ),
            ),
          ],
        ),
        bottomSheet: SingleChildScrollView(
          child: BottomSheet(
            enableDrag: false,
            backgroundColor: AppColor.white1Color,
            onClosing: () => context,
            builder: (context) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CommonWidget.commonText(
                        text: Strings.login,
                        color: AppColor.primary1Color,
                        fontSize: 26,
                      ),
                    ],
                  ),
                  CommonWidget.sizedBox(
                    height: 30,
                  ),
                  CommonWidget.commonText(
                    text: Strings.enter_email_id,
                    color: AppColor.primary1Color,
                  ),
                  CommonWidget.sizedBox(
                    height: 5,
                  ),
                  CommonWidget.textFormField(
                    keyboardType: TextInputType.emailAddress,
                    hintText: Strings.usergmail_com,
                    hintColor: AppColor.primary1Color,
                    textInputAction: TextInputAction.next,
                    suffixIcon: CommonWidget.commonIcon(
                      icon: Icons.email_rounded,
                      color: AppColor.primary1Color,
                    ),
                  ),
                  CommonWidget.sizedBox(
                    height: 15,
                  ),
                  CommonWidget.commonText(
                    text: Strings.enter_password,
                    color: AppColor.primary1Color,
                  ),
                  CommonWidget.sizedBox(
                    height: 5,
                  ),
                  CommonWidget.textFormField(
                    keyboardType: TextInputType.text,
                    hintText: Strings.hint_password,
                    hintColor: AppColor.primary1Color,
                    textInputAction: TextInputAction.done,
                    obscureText: true,
                    suffixIcon: CommonWidget.commonIcon(
                      icon: Icons.visibility_off_rounded,
                      color: AppColor.primary1Color,
                    ),
                  ),
                  CommonWidget.sizedBox(
                    height: 40,
                  ),
                  CommonWidget.commonButton(
                    width: double.infinity,
                    buttonColor: AppColor.primary2Color,
                    color: AppColor.white1Color,
                    text: Strings.login,
                    fontSize: 16,
                    onTap: () {},
                  ),
                  CommonWidget.sizedBox(height: 180),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CommonWidget.commonText(
                        text: Strings.dont_have_an_account,
                        fontSize: 13,
                        color: AppColor.default1Color,
                      ),
                      CommonWidget.commonButton(
                        width: 90,
                        height: 30,
                        buttonColor: AppColor.white1Color,
                        text: Strings.register_now,
                        fontSize: 13,
                        color: AppColor.primary1Color,
                        onTap: () {
                          CommonRoute.pushNamed(page: RouteList.signup_screen);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
