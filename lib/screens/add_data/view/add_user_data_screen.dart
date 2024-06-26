import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:unk/common/colors.dart';
import 'package:unk/common/common_widget.dart';
import 'package:unk/screens/add_data/controller/add_user_data_controller.dart';
import 'package:unk/widgets/strings.dart';

class AddUserDataScreen extends StatefulWidget {
  const AddUserDataScreen({super.key});

  @override
  State<AddUserDataScreen> createState() => _AddUserDataScreenState();
}

class _AddUserDataScreenState extends State<AddUserDataScreen> {
  late AddUserDataController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(AddUserDataController());
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
                        padding: EdgeInsets.only(top: 15.h),
                        child: CommonWidget.commonText(
                          text: Strings.add_Your_Data,
                          color: AppColor.white1Color,
                          fontSize: 18.sp,
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
        height: ScreenUtil().screenHeight * 0.87,
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CommonWidget.sizedBox(height: 30),
                  textFeildView(
                    controller: controller.firstNameController,
                    title: Strings.enter_First_name,
                    hint: Strings.ex_username,
                    keyboardType: TextInputType.name,
                    requiredFeild: Strings.requiredTextFeild,
                    errorMessage: Strings.please_enter_first_name,
                  ),
                  CommonWidget.sizedBox(height: 10),
                  textFeildView(
                    controller: controller.lastNameController,
                    title: Strings.enter_Last_name,
                    hint: Strings.ex_surname,
                    keyboardType: TextInputType.name,
                    requiredFeild: Strings.requiredTextFeild,
                    errorMessage: Strings.please_enter_last_name,
                  ),
                  CommonWidget.sizedBox(height: 10),
                  textFeildView(
                    controller: controller.middleNameController,
                    title: Strings.enter_Middle_name,
                    hint: Strings.ex_middle_name,
                    keyboardType: TextInputType.name,
                    requiredFeild: Strings.requiredTextFeild,
                    errorMessage: Strings.please_enter_middle_name,
                  ),
                  CommonWidget.sizedBox(height: 10),
                  textFeildView(
                    controller: controller.emailIdController,
                    title: Strings.enter_email_id,
                    hint: Strings.ex_email_id,
                    keyboardType: TextInputType.emailAddress,
                    requiredFeild: Strings.requiredTextFeild,
                    errorMessage: Strings.please_enter_email,
                  ),
                  CommonWidget.sizedBox(height: 10),
                  textFeildView(
                    controller: controller.mobileController,
                    title: Strings.enter_Mobile_number,
                    hint: Strings.hint_mobileNo,
                    keyboardType: TextInputType.number,
                  ),
                  CommonWidget.sizedBox(height: 10),
                  textFeildView(
                    controller: controller.birthDateController,
                    title: Strings.select_date_of_birht,
                    hint: Strings.hint_of_birth,
                    readOnly: true,
                    requiredFeild: Strings.requiredTextFeild,
                    errorMessage: Strings.please_select_date_of_birth,
                    onTap: () {
                      controller.pickDate(context: context);
                    },
                  ),
                  CommonWidget.sizedBox(height: 38),
                  CommonWidget.commonButton(
                    text: Strings.add_Your_Data,
                    onTap: () {
                      bool? isValid =
                          controller.formKey.currentState?.validate();
                      controller.checkEmailValidator(context: context);
                      if (isValid ?? false) {}
                    },
                  ),
                  CommonWidget.sizedBox(height: 38),
                ],
              ),
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
    String? requiredFeild,
    String? errorMessage,
    bool readOnly = false,
    void Function()? onTap,
    TextInputType? keyboardType,
    bool isShowText = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            CommonWidget.commonText(
              text: title,
              fontSize: 14,
              color: AppColor.primary1Color,
            ),
            CommonWidget.commonText(
              text: requiredFeild ?? "",
              fontSize: 14,
              color: AppColor.red1Color,
            ),
          ],
        ),
        CommonWidget.sizedBox(height: 5),
        CommonWidget.textFormField(
          hintText: hint,
          readOnly: readOnly,
          obscureText: isShowText,
          keyboardType: keyboardType,
          controller: controller,
          hintColor: AppColor.primary1Color,
          textColor: AppColor.primary1Color,
          borderColor: AppColor.primary1Color,
          validator: (value) {
            if (value?.isEmpty ?? false) {
              return errorMessage;
            }
            return null;
          },
          onTap: onTap,
        ),
      ],
    );
  }
}
