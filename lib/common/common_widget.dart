import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unk/common/colors.dart';
import 'package:unk/common/common_router.dart';
import 'package:unk/widgets/images.dart';
import 'package:unk/widgets/strings.dart';

class CommonWidget {
  static Widget textFormField({
    TextEditingController? controller,
    String? hintText,
    Color? fillColor,
    Color? borderColor,
    double? radius,
    bool obscureText = false,
    String? Function(String?)? validator,
    Color? hintColor,
    Color? textColor,
    double? fontSize,
    bool enabled = true,
    Widget? suffixIcon,
    TextInputType? keyboardType,
    void Function(String)? onChanged,
    EdgeInsetsGeometry? contentPadding,
  }) {
    return TextFormField(
      keyboardType: keyboardType ?? TextInputType.name,
      controller: controller,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: obscureText,
      enabled: enabled,
      onChanged: onChanged,
      style: TextStyle(
        color: textColor ?? AppColor.primary1Color,
        fontSize: fontSize ?? 16.sp,
      ),
      decoration: InputDecoration(
        contentPadding: contentPadding,
        suffixIcon: suffixIcon,
        hintText: hintText ?? Strings.enter_data,
        hintStyle: TextStyle(
          color: hintColor ?? AppColor.default6Color,
          fontSize: fontSize ?? 16.sp,
        ),
        // filled: true,
        // fillColor: fillColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius ?? 10.r),
          borderSide: BorderSide(color: borderColor ?? AppColor.default1Color),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius ?? 10.r),
          borderSide: BorderSide(color: AppColor.red1Color),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius ?? 10.r),
          borderSide: BorderSide(color: borderColor ?? AppColor.default1Color),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius ?? 10.r),
          borderSide: BorderSide(color: borderColor ?? AppColor.default1Color),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius ?? 10.r),
          borderSide: BorderSide(color: borderColor ?? AppColor.default1Color),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius ?? 10.r),
          borderSide: BorderSide(color: AppColor.red1Color),
        ),
      ),
    );
  }

  static Widget commonButton({
    required String text,
    required void Function() onTap,
    double? width,
    double? height,
    Color? buttonColor,
    double? radius,
    Color? color,
    double? fontSize,
  }) {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      onTap: onTap,
      child: Container(
        height: height ?? 50.h,
        width: width ?? 200.h,
        decoration: BoxDecoration(
          color: buttonColor ?? AppColor.secondery1Color,
          borderRadius: BorderRadius.circular(radius ?? 10.r),
        ),
        alignment: Alignment.center,
        child: commonText(
          text: text,
          color: color ?? AppColor.white1Color,
          fontSize: fontSize ?? 16.sp,
        ),
      ),
    );
  }

  static Widget commonText({
    required String text,
    TextOverflow? overflow,
    int? maxLines,
    TextStyle? style,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    TextAlign? textAlign,
  }) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.start,
      overflow: overflow ?? TextOverflow.ellipsis,
      maxLines: maxLines ?? 1,
      style: style ??
          TextStyle(
            color: color ?? AppColor.default1Color,
            fontWeight: fontWeight ?? FontWeight.w500,
            fontSize: fontSize ?? 16.sp,
          ),
    );
  }

  static PreferredSizeWidget commonAppBar({
    required String title,
    Color? titleColor,
    Color? bgColor,
    Widget? leading,
    List<Widget>? actions,
    IconData? icon,
    void Function()? onPressed,
  }) {
    return AppBar(
      centerTitle: false,
      leading: leading ??
          commonIconButton(
            icon: icon ?? Icons.arrow_back_ios_new_rounded,
            onPressed: onPressed ?? () => CommonRoute.pop(),
            color: AppColor.white1Color,
          ),
      actions: actions,
      title: commonText(text: title, color: AppColor.white1Color),
      backgroundColor: bgColor ?? AppColor.secondery1Color,
    );
  }

  static Widget commonContainer({
    required Widget child,
    double? height,
    double? width,
    bool isBorderRadiusOnly = false,
    double? radius,
    double? topLeft,
    double? topRight,
    double? bottomLeft,
    double? bottomRight,
    Color? color,
    EdgeInsetsGeometry? padding,
  }) {
    return Container(
      height: height ?? 50.h,
      width: width ?? 50.w,
      padding: padding ?? EdgeInsets.all(6.h),
      decoration: BoxDecoration(
        color: color ?? AppColor.white1Color,
        borderRadius: isBorderRadiusOnly
            ? BorderRadius.only(
                bottomLeft: Radius.circular(bottomLeft ?? 10.r),
                bottomRight: Radius.circular(bottomRight ?? 10.r),
                topLeft: Radius.circular(topLeft ?? 10.r),
                topRight: Radius.circular(topRight ?? 10.r),
              )
            : BorderRadius.circular(radius ?? 10.r),
      ),
      child: child,
    );
  }

  static Widget commonIconButton({
    required IconData icon,
    required void Function()? onPressed,
    Color? color,
    double? size,
  }) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: color ?? AppColor.default1Color,
        size: size,
      ),
    );
  }

  static Widget loadingBar() {
    return Center(
      child: CircularProgressIndicator(
        color: AppColor.secondery1Color,
      ),
    );
  }

  static Widget commonIcon({required IconData icon, Color? color}) {
    return Icon(
      icon,
      color: color ?? AppColor.default1Color,
    );
  }

  static Widget noDataFound() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          imageBuilder(
            imagePath: Images.data_not_image,
            height: 150.h,
          ),
          sizedBox(height: 20),
          commonText(text: Strings.sorry_no_data_found)
        ],
      ),
    );
  }

  static Widget sizedBox({
    double? height,
    double? width,
    Widget? child,
    bool isShrink = false,
    bool isExpand = false,
  }) {
    if (isShrink) {
      return SizedBox.shrink(child: child);
    }
    if (isExpand) {
      return SizedBox.expand(child: child);
    }
    return SizedBox(height: height?.h, width: width?.w, child: child);
  }

  static Widget commonAddButton({required void Function() onPressed}) {
    return FloatingActionButton(
      backgroundColor: AppColor.secondery1Color,
      onPressed: onPressed,
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(20.sp),
      ),
      child: CommonWidget.commonIcon(
        icon: Icons.add,
        color: AppColor.white1Color,
      ),
    );
  }

  static String stringToRupee({required text}) {
    return "₹$text";
  }

  static Widget imageBuilder({
    required String imagePath,
    BoxFit? fit,
    double? height,
    double? width,
    Color? color,
  }) {
    if (imagePath.startsWith('assets')) {
      return Image.asset(
        imagePath,
        fit: fit,
        height: height,
        width: width,
        color: color,
        errorBuilder: (context, error, stackTrace) {
          return Image.asset(
            Images.wraning_image,
            color: AppColor.primary1Color,
          );
        },
      );
    } else if (imagePath.startsWith('https')) {
      return Image.network(
        imagePath,
        fit: fit ?? BoxFit.cover,
        height: height,
        width: width,
        color: color,
      );
    } else {
      return sizedBox(isShrink: true);
    }
  }

  static Future<dynamic> commonDialog({
    required BuildContext context,
    required void Function() onTap,
    required String titleText,
    required String subTitleText,
  }) {
    return showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          backgroundColor: AppColor.white1Color,
          titlePadding: EdgeInsets.zero,
          insetPadding: EdgeInsets.symmetric(
            horizontal: 16.w,
          ),
          surfaceTintColor: AppColor.white1Color,
          title: Container(
            alignment: Alignment.center,
            height: 50.h,
            width: ScreenUtil().screenWidth,
            child: CommonWidget.commonText(
              text: titleText,
              textAlign: TextAlign.center,
            ),
          ),
          content: CommonWidget.sizedBox(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CommonWidget.commonText(
                  text: subTitleText,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
                CommonWidget.sizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CommonWidget.sizedBox(width: 10),
                    Expanded(
                      child: CommonWidget.commonButton(
                        height: 50.h,
                        text: Strings.no,
                        onTap: () => CommonRoute.pop(),
                      ),
                    ),
                    CommonWidget.sizedBox(width: 10),
                    Expanded(
                      child: CommonWidget.commonButton(
                        height: 50.h,
                        text: Strings.yes,
                        onTap: onTap,
                      ),
                    ),
                    CommonWidget.sizedBox(width: 10),
                  ],
                ),
                CommonWidget.sizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }
}
