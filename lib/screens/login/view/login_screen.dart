import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:unk/common/colors.dart';
import 'package:unk/common/common_router.dart';
import 'package:unk/common/common_widget.dart';
import 'package:unk/common/global.dart';
import 'package:unk/common/route_list.dart';
import 'package:unk/screens/login/controller/login_controller.dart';
import 'package:unk/widgets/strings.dart';
import 'package:unk/widgets/images.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginController controller;

  @override
  void initState() {
    controller = Get.put(LoginController()); //ak var git destop joi let
    super.initState();
  }

  @override
  void dispose() {
    controller.emailIdController.dispose();
    controller.passwordController.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: GetBuilder(
          init: controller,
          builder: (_) {
            return Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                    AppColor.primary2Color,
                    AppColor.primary2Color,
                    AppColor.primary2Color,
                    AppColor.primary1Color,
                  ],
                ),
              ),
              child: Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 45.h),
                        child: CommonWidget.imageBuilder(
                          imagePath: generalSettingModel?.data.logoImage ??
                              Images.splash_iamge,
                          height: 130,
                        ),
                      ),
                    ],
                  ),
                  bottomView(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget bottomView() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: ScreenUtil().screenHeight * 0.68,
        width: ScreenUtil().screenWidth,
        decoration: BoxDecoration(
          color: AppColor.white1Color,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r),
            topRight: Radius.circular(30.r),
          ),
        ),
        child: Form(
          key: controller.formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                CommonWidget.sizedBox(height: 20),
                CommonWidget.commonText(
                  text: Strings.login,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: AppColor.primary1Color,
                ),
                CommonWidget.sizedBox(height: 38),
                textFeildView(
                  controller: controller.emailIdController,
                  title: Strings.enter_email_id,
                  hint: Strings.ex_email_id,
                  errorMessage: Strings.please_enter_email,
                  imagePath: Images.email_svg,
                ),
                CommonWidget.sizedBox(height: 10),
                textFeildView(
                  controller: controller.passwordController,
                  title: Strings.enter_password,
                  hint: Strings.hint_password,
                  errorMessage: Strings.please_enter_password,
                  imagePath: controller.isShowText
                      ? Images.close_eye_svg
                      : Images.open_eye_svg,
                  isShowText: controller.isShowText,
                  onTap: () {
                    controller.isShowText = !controller.isShowText;
                    controller.update();
                  },
                ),
                CommonWidget.sizedBox(height: 38),
                CommonWidget.commonButton(
                  text: Strings.login,
                  onTap: () {
                    bool? isValid = controller.formKey.currentState?.validate();
                    if (isValid ?? false) {
                      controller.userLogin();
                    }
                  },
                ),
                const Spacer(),
                InkWell(
                  onTap: () => CommonRoute.pushNamed(
                    page: RouteList.signup_screen,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CommonWidget.commonText(
                        text: Strings.dont_have_an_account,
                        fontSize: 12,
                      ),
                      CommonWidget.commonText(
                        text: Strings.register_now,
                        color: AppColor.primary1Color,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
                CommonWidget.sizedBox(height: 38),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget textFeildView({
    required TextEditingController controller,
    required String title,
    required String hint,
    required String imagePath,
    required String errorMessage,
    void Function()? onTap,
    bool isShowText = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CommonWidget.commonText(
          text: title,
          fontSize: 14,
          color: AppColor.primary1Color,
        ),
        CommonWidget.sizedBox(height: 5),
        CommonWidget.textFormField(
          hintText: hint,
          obscureText: isShowText,
          controller: controller,
          hintColor: AppColor.primary1Color,
          textColor: AppColor.primary1Color,
          validator: (value) {
            if (value?.isEmpty ?? false) {
              return errorMessage;
            }
            return null;
          },
          suffixIcon: InkWell(
            onTap: onTap,
            child: Container(
              alignment: Alignment.center,
              width: 24,
              child: CommonWidget.imageBuilder(
                imagePath: imagePath,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
