import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
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
    bool readOnly = false,
    Widget? suffixIcon,
    TextInputType? keyboardType,
    void Function(String)? onChanged,
    EdgeInsetsGeometry? contentPadding,
    TextInputAction? textInputAction,
    void Function()? onTap,
  }) {
    return TextFormField(
      autofocus: false,
      textInputAction: textInputAction,
      keyboardType: keyboardType ?? TextInputType.name,
      controller: controller,
      validator: validator,
      readOnly: readOnly,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: obscureText,
      enabled: enabled,
      onChanged: onChanged,
      onTap: onTap,
      style: TextStyle(
        color: textColor ?? AppColor.primary1Color,
        fontSize: fontSize?.sp ?? 16.sp,
      ),
      decoration: InputDecoration(
        contentPadding: contentPadding,
        suffixIcon: suffixIcon,
        hintText: hintText ?? Strings.enter_data,
        hintStyle: TextStyle(
          color: hintColor ?? AppColor.default6Color,
          fontSize: fontSize?.sp ?? 14.sp,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius?.r ?? 10.r),
          borderSide: BorderSide(
              color: borderColor ?? AppColor.default1Color, width: 2.w),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius?.r ?? 10.r),
          borderSide: BorderSide(color: AppColor.red1Color, width: 2.w),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius?.r ?? 10.r),
          borderSide: BorderSide(
              color: borderColor ?? AppColor.default1Color, width: 2.w),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius?.r ?? 10.r),
          borderSide: BorderSide(
              color: borderColor ?? AppColor.default1Color, width: 2.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius?.r ?? 10.r),
          borderSide: BorderSide(
              color: borderColor ?? AppColor.default1Color, width: 2.w),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius?.r ?? 10.r),
          borderSide: BorderSide(color: AppColor.red1Color, width: 2.w),
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
    TextStyle? textStyle,
  }) {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      onTap: onTap,
      child: Container(
        height: height?.h ?? 50.h,
        width: width?.w ?? ScreenUtil().screenWidth,
        decoration: BoxDecoration(
          color: buttonColor ?? AppColor.primary2Color,
          borderRadius: BorderRadius.circular(radius?.r ?? 10.r),
        ),
        alignment: Alignment.center,
        child: commonText(
          style: textStyle,
          text: text,
          color: color ?? AppColor.white1Color,
          fontSize: fontSize?.sp ?? 16.sp,
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
            fontSize: fontSize?.sp ?? 16.sp,
          ),
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
      height: height?.h ?? 50.h,
      width: width?.w ?? 50.w,
      padding: padding ?? EdgeInsets.all(6.r),
      decoration: BoxDecoration(
        color: color ?? AppColor.white1Color,
        borderRadius: isBorderRadiusOnly
            ? BorderRadius.only(
                bottomLeft: Radius.circular(bottomLeft?.r ?? 10.r),
                bottomRight: Radius.circular(bottomRight?.r ?? 10.r),
                topLeft: Radius.circular(topLeft?.r ?? 10.r),
                topRight: Radius.circular(topRight?.r ?? 10.r),
              )
            : BorderRadius.circular(radius?.r ?? 10.r),
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
    return Container(
      height: ScreenUtil().screenHeight,
      width: ScreenUtil().screenWidth,
      color: AppColor.primary1Color.withOpacity(0.4),
      alignment: Alignment.center,
      child: CommonWidget.loadingIos(),
    );
  }

  static Widget commonIcon({
    required IconData icon,
    Color? color,
    double? size,
  }) {
    return Icon(
      icon,
      color: color ?? AppColor.default1Color,
      size: size?.h,
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

  static String stringToRupee({required text}) {
    return "₹$text";
  }

  static Widget imageBuilder({
    required String imagePath,
    double? height,
    double? width,
    double? borderRadius,
    int? cacheWidth,
    BoxFit? fit,
    Color? color,
    bool? isBorderOnlySide,
    Radius? bottomLeft,
    Radius? bottomRight,
    Radius? topLeft,
    Radius? topRight,
  }) {
    if (imagePath.isEmpty) {
      return Center(child: warningIcon(color: color));
    } else if (imagePath.startsWith('https')) {
      if (imagePath.endsWith('svg')) {
        return SvgPicture.network(
          imagePath,
          fit: fit ?? BoxFit.fitWidth,
          width: width?.w,
          height: height?.h,
          colorFilter:
              color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
          placeholderBuilder: (context) => sizedBox(
            width: width,
            height: height,
            child: sizedBox(
              width: width,
              height: height,
              child: loadingIos(),
            ),
          ),
        );
      } else {
        return ClipRRect(
          borderRadius: isBorderOnlySide == true
              ? BorderRadius.only(
                  bottomLeft: bottomLeft?.r ?? Radius.zero,
                  bottomRight: bottomRight?.r ?? Radius.zero,
                  topLeft: topLeft?.r ?? Radius.zero,
                  topRight: topRight?.r ?? Radius.zero,
                )
              : BorderRadius.circular(borderRadius?.r ?? 0),
          child: CachedNetworkImage(
            imageUrl: imagePath,
            fit: fit ?? BoxFit.cover,
            memCacheWidth: cacheWidth,
            color: color,
            height: height?.h,
            width: width?.w,
            placeholder: (context, url) => sizedBox(
              height: height,
              width: width,
              child: loadingIos(),
            ),
            errorListener: (value) => sizedBox(
              height: height,
              width: width,
              child: loadingIos(),
            ),
            errorWidget: (context, error, stackTrace) => warningIcon(
              color: color,
              bgColor: Colors.grey.withOpacity(0.15),
            ),
          ),
        );
      }
    } else if (imagePath.startsWith('assets') && imagePath.endsWith('.svg')) {
      return SvgPicture.asset(
        imagePath,
        fit: fit ?? BoxFit.fitWidth,
        width: width?.w,
        height: height?.h,
        colorFilter:
            color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
      );
    } else if (imagePath.startsWith('assets')) {
      return Image.asset(
        imagePath,
        fit: fit ?? BoxFit.fitWidth,
        width: width?.w,
        height: height?.h,
        color: color,
        cacheWidth: cacheWidth,
        errorBuilder: (context, error, stackTrace) => warningIcon(color: color),
      );
    } else if (imagePath.endsWith('.svg')) {
      return SvgPicture.file(
        File(imagePath),
        fit: fit ?? BoxFit.fitWidth,
        width: width?.w,
        height: height?.h,
        colorFilter:
            color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
      );
    } else {
      return Image.file(
        File(imagePath),
        fit: fit ?? BoxFit.fitWidth,
        width: width?.w,
        height: height?.h,
        color: color,
        cacheWidth: cacheWidth,
        errorBuilder: (context, error, stackTrace) => warningIcon(color: color),
      );
    }
  }

  static Widget loadingIos({bool isShowListLoader = false}) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: sizedBox(
          height: isShowListLoader ? 100 : 300,
          width: isShowListLoader ? 100 : 300,
          child: Center(
            child: Center(
              child: CircularProgressIndicator(
                color: AppColor.primary1Color,
                strokeWidth: 2,
                backgroundColor: AppColor.white1Color,
                strokeCap: StrokeCap.square,
              ),
            ),
          ),
        ),
      ),
    );
  }

  static Widget warningIcon({
    double? width,
    double? height,
    Color? color,
    Alignment? alignment,
    Color? bgColor,
  }) {
    return Container(
      color: bgColor,
      child: Center(
        child: SvgPicture.asset(
          Images.wraning_image_svg,
          width: width?.w ?? 32.w,
          height: height?.h ?? 32.h,
          colorFilter: ColorFilter.mode(
            color ?? AppColor.default1Color,
            BlendMode.srcIn,
          ),
          alignment: alignment ?? Alignment.center,
        ),
      ),
    );
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
            child: commonText(
              text: titleText,
              textAlign: TextAlign.center,
            ),
          ),
          content: sizedBox(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                commonText(
                  text: subTitleText,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
                sizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    sizedBox(width: 10),
                    Expanded(
                      child: commonButton(
                        height: 50.h,
                        text: Strings.no,
                        onTap: () => CommonRoute.pop(),
                      ),
                    ),
                    sizedBox(width: 10),
                    Expanded(
                      child: commonButton(
                        height: 50.h,
                        text: Strings.yes,
                        onTap: onTap,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static void commonSnackBar({
    required BuildContext context,
    required String message,
    required SnackBarType type,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: type == SnackBarType.successData
            ? Colors.green
            : AppColor.red1Color,
        content: commonText(
          text: message,
          color: type == SnackBarType.successData
              ? Colors.white
              : AppColor.white1Color,
        ),
      ),
    );
  }

  static Widget commonScreenUI({
    String? title,
    Widget? child,
    Widget? titleWidget,
    double? height,
    Widget? bottomNavigationBar,
  }) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.primary1Color,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20.w, top: 10.h),
            child: titleWidget ??
                Row(
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      splashFactory: NoSplash.splashFactory,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () => CommonRoute.pop(),
                      child: Container(
                        height: 30.h,
                        width: 50.w,
                        alignment: Alignment.centerLeft,
                        child: imageBuilder(imagePath: Images.back_arrow_svg),
                      ),
                    ),
                    commonText(text: title ?? "", color: AppColor.white1Color),
                  ],
                ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: ScreenUtil().screenWidth,
              height: height ?? ScreenUtil().screenHeight * 0.88,
              decoration: BoxDecoration(
                color: AppColor.white1Color,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.r),
                  topRight: Radius.circular(30.r),
                ),
              ),
              child: child,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: bottomNavigationBar ?? CommonWidget.sizedBox(),
          ),
        ],
      ),
    );
  }
}

enum SnackBarType { successData, errorData }
