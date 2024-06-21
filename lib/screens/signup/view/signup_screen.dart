import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unk/common/colors.dart';
import 'package:unk/common/common_router.dart';
import 'package:unk/common/common_validator.dart';
import 'package:unk/common/common_widget.dart';
import 'package:unk/common/global.dart';
import 'package:unk/common/route_list.dart';
import 'package:unk/widgets/strings.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => CommonValidator.hideKeyboard,
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            alignment: Alignment.topCenter,
            children: [
              Center(
                child: CommonWidget.imageBuilder(
                  height: ScreenUtil().screenHeight,
                  width: ScreenUtil().screenWidth,
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CommonWidget.commonText(
                          text: Strings.signup,
                          fontSize: 26,
                          color: AppColor.primary1Color,
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
                      hintText: Strings.ex_email_id,
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
                      obscureText: true,
                      textInputAction: TextInputAction.next,
                      suffixIcon: CommonWidget.commonIcon(
                        icon: Icons.visibility_off_rounded,
                        color: AppColor.primary1Color,
                      ),
                    ),
                    CommonWidget.sizedBox(
                      height: 15,
                    ),
                    CommonWidget.commonText(
                      text: Strings.enter_re_password,
                      color: AppColor.primary1Color,
                    ),
                    CommonWidget.sizedBox(
                      height: 5,
                    ),
                    CommonWidget.textFormField(
                      keyboardType: TextInputType.text,
                      hintText: Strings.hint_password,
                      hintColor: AppColor.primary1Color,
                      obscureText: true,
                      textInputAction: TextInputAction.done,
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
                      text: Strings.signup,
                      fontSize: 16,
                      onTap: () {},
                    ),
                    CommonWidget.sizedBox(height: 90),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CommonWidget.commonText(
                          text: Strings.already_have_an_account,
                          fontSize: 13,
                          color: AppColor.default1Color,
                        ),
                        CommonWidget.commonButton(
                          width: 70,
                          height: 30,
                          buttonColor: AppColor.white1Color,
                          text: Strings.login_now,
                          fontSize: 13,
                          color: AppColor.primary1Color,
                          onTap: () {
                            CommonRoute.pushNamed(page: RouteList.login_screen);
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
      ),
    );
  }
}
