import 'package:flutter_ukn_earning_app/exports.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late SignupController controller;

  @override
  void initState() {
    controller = Get.put(SignupController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      builder: (context) {
        return Stack(
          children: [
            CommonWidget.commonScreenUI(
              titleWidget: Padding(
                padding: EdgeInsets.only(top: 45.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CommonWidget.imageBuilder(
                      imagePath: generalSettingModel?.data.logoImage ?? "",
                      height: 130,
                    ),
                  ],
                ),
              ),
              height: ScreenUtil().screenHeight * 0.68,
              child: bottomView(),
            ),
            GetBuilder(
              init: controller,
              builder: (_) => _.isLoading
                  ? CommonWidget.loadingBar()
                  : CommonWidget.sizedBox(isShrink: true),
            ),
          ],
        );
      },
    );
  }

  Widget bottomView() {
    return SingleChildScrollView(
      child: Form(
        key: controller.formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              CommonWidget.sizedBox(height: 20),
              CommonWidget.commonText(
                text: Strings.signup,
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
              CommonWidget.sizedBox(height: 10),
              textFeildView(
                controller: controller.rePasswordController,
                title: Strings.enter_re_password,
                hint: Strings.hint_password,
                errorMessage: Strings.please_enter_password,
                imagePath: controller.isReShowText
                    ? Images.close_eye_svg
                    : Images.open_eye_svg,
                isShowText: controller.isReShowText,
                onTap: () {
                  controller.isReShowText = !controller.isReShowText;
                  controller.update();
                },
              ),
              CommonWidget.sizedBox(height: 38),
              CommonWidget.commonButton(
                text: Strings.signup,
                onTap: () {
                  bool? isValid = controller.formKey.currentState?.validate();

                  if (isValid ?? false) {
                    String password = controller.passwordController.text;
                    String rePassword = controller.rePasswordController.text;
                    if (password == rePassword) {
                      controller.userSignUp(context: context);
                    } else {
                      CommonWidget.commonSnackBar(
                        context: context,
                        message: "Password Or re password dos't match",
                        type: SnackBarType.errorData,
                      );
                    }
                  }
                },
              ),
              CommonWidget.sizedBox(height: 50),
              InkWell(
                onTap: () => CommonRoute.pop(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CommonWidget.commonText(
                      text: Strings.already_have_an_account,
                      fontSize: 12,
                    ),
                    CommonWidget.commonText(
                      text: Strings.login_now,
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
              width: 24.h,
              height: 24.h,
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
