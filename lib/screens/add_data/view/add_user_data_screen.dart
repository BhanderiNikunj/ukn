import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:unk/common/colors.dart';
import 'package:unk/common/common_widget.dart';
import 'package:unk/model/login_model.dart';
import 'package:unk/screens/add_data/controller/add_user_data_controller.dart';
import 'package:unk/widgets/strings.dart';

class AddUserDataScreen extends StatefulWidget {
  const AddUserDataScreen({super.key});

  @override
  State<AddUserDataScreen> createState() => _AddUserDataScreenState();
}

class _AddUserDataScreenState extends State<AddUserDataScreen> {
  late AddUserDataController controller;
  LoginDataModel loginDataModel = Get.arguments;

  @override
  void initState() {
    super.initState();
    controller = Get.put(AddUserDataController());
    controller.emailIdController.text = loginDataModel.email;
  }

  @override
  void dispose() {
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
              color: AppColor.primary1Color,
              child: Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 15.h),
                        child: CommonWidget.commonText(
                          text: Strings.add_your_data,
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
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  CommonWidget.sizedBox(height: 30),
                  textFeildView(
                    controller: controller.firstNameController,
                    title: Strings.enter_first_name,
                    hint: Strings.ex_username,
                    keyboardType: TextInputType.name,
                    errorMessage: Strings.please_enter_first_name,
                  ),
                  CommonWidget.sizedBox(height: 10),
                  textFeildView(
                    controller: controller.middleNameController,
                    title: Strings.enter_middle_name,
                    hint: Strings.ex_middle_name,
                    keyboardType: TextInputType.name,
                    errorMessage: Strings.please_enter_middle_name,
                  ),
                  CommonWidget.sizedBox(height: 10),
                  textFeildView(
                    controller: controller.lastNameController,
                    title: Strings.enter_last_name,
                    hint: Strings.ex_surname,
                    keyboardType: TextInputType.name,
                    errorMessage: Strings.please_enter_last_name,
                  ),
                  CommonWidget.sizedBox(height: 10),
                  textFeildView(
                    controller: controller.emailIdController,
                    title: Strings.enter_email_id,
                    hint: Strings.ex_email_id,
                    keyboardType: TextInputType.emailAddress,
                    errorMessage: Strings.please_enter_email,
                  ),
                  CommonWidget.sizedBox(height: 10),
                  textFeildView(
                    controller: controller.mobileController,
                    title: Strings.enter_mobile_number,
                    hint: Strings.hint_mobileNo,
                    keyboardType: TextInputType.number,
                    errorMessage: Strings.enter_mobile_number,
                  ),
                  CommonWidget.sizedBox(height: 10),
                  textFeildView(
                    controller: controller.birthDateController,
                    title: Strings.select_date_of_birht,
                    hint: Strings.hint_of_birth,
                    readOnly: true,
                    errorMessage: Strings.please_select_date_of_birth,
                    onTap: () {
                      controller.pickDate(context: context);
                    },
                  ),
                  CommonWidget.sizedBox(height: 10),
                  textFeildView(
                    title: Strings.select_gender,
                    extraWidget: DropdownButtonFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: BorderSide(
                              color: AppColor.default1Color, width: 2.w),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide:
                              BorderSide(color: AppColor.red1Color, width: 2.w),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: BorderSide(
                              color: AppColor.default1Color, width: 2.w),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: BorderSide(
                              color: AppColor.default1Color, width: 2.w),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: BorderSide(
                              color: AppColor.default1Color, width: 2.w),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide:
                              BorderSide(color: AppColor.red1Color, width: 2.w),
                        ),
                      ),
                      validator: (value) {
                        if (value?.isEmpty ?? false) {
                          return Strings.please_select_gender;
                        }
                        return null;
                      },
                      value: controller.genderType,
                      isExpanded: true,
                      items: [
                        DropdownMenuItem(
                          value: 'male',
                          child: CommonWidget.commonText(
                            text: 'Male',
                            color: AppColor.primary1Color,
                          ),
                        ),
                        DropdownMenuItem(
                          value: 'female',
                          child: CommonWidget.commonText(
                            text: 'Female',
                            color: AppColor.primary1Color,
                          ),
                        ),
                      ],
                      onChanged: (value) {
                        controller.genderType = value ?? "";
                        controller.update();
                      },
                    ),
                  ),
                  CommonWidget.sizedBox(height: 38),
                  CommonWidget.commonButton(
                    text: Strings.add_your_data,
                    onTap: () => controller.allUserData(
                      context: context,
                      loginData: loginDataModel,
                    ),
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
    TextEditingController? controller,
    required String title,
    String? hint,
    String? errorMessage,
    bool readOnly = false,
    void Function()? onTap,
    TextInputType? keyboardType,
    bool isShowText = false,
    Widget? extraWidget,
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
              text: Strings.required_textfeild,
              fontSize: 14,
              color: AppColor.red1Color,
            ),
          ],
        ),
        CommonWidget.sizedBox(height: 5),
        extraWidget ??
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
