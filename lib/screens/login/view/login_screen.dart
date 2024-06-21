import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unk/common/colors.dart';
import 'package:unk/common/common_validator.dart';
import 'package:unk/common/common_widget.dart';
import 'package:unk/common/text_style.dart';

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
                imagePath:
                    "https://homeincomeexpanseapi.000webhostapp.com/ukn_api/images/splash_screen/Splash%20Screen.jpg",
              ),
            ),
            Positioned(
              top: 40,
              child: CommonWidget.imageBuilder(
                height: 120,
                width: 120,
                imagePath:
                    "https://homeincomeexpanseapi.000webhostapp.com/ukn_api/images/splash_screen/app_logo.png",
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
                        text: "Login",
                        style: poppinsBold.copyWith(
                          color: AppColor.primary1Color,
                          fontSize: 26,
                        ),
                      ),
                    ],
                  ),
                  CommonWidget.sizedBox(
                    height: 30,
                  ),
                  CommonWidget.commonText(
                    text: "Enter Email id",
                    style: poppinsMedium.copyWith(
                      color: AppColor.primary1Color,
                    ),
                  ),
                  CommonWidget.sizedBox(
                    height: 5,
                  ),
                  CommonWidget.textFormField(
                    keyboardType: TextInputType.emailAddress,
                    hintText: "user@gmail.com",
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
                    text: "Enter Password",
                    style: poppinsMedium.copyWith(color: AppColor.primary1Color,),
                  ),
                  CommonWidget.sizedBox(
                    height: 5,
                  ),
                  CommonWidget.textFormField(
                    keyboardType: TextInputType.text,
                    hintText: "********",
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
                    text: "Login",
                    textStyle: poppinsBold.copyWith(
                      color: AppColor.white1Color,
                      fontSize: 16,
                    ),
                    onTap: () {},
                  ),
                  CommonWidget.sizedBox(height: 180),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CommonWidget.commonText(
                        text: "Don’t have an account? ",
                        style: interRegular.copyWith(
                          fontSize: 13,
                          color: AppColor.default1Color,
                        ),
                      ),
                      CommonWidget.commonButton(
                        width: 90,
                        height: 30,
                        buttonColor: AppColor.white1Color,
                        text: "Register Now",
                        textStyle: interBold.copyWith(
                          fontSize: 13,
                          color: AppColor.primary1Color,
                        ),
                        onTap: () {
                          Get.toNamed("/register_screen");
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
