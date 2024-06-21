import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:unk/common/colors.dart';
import 'package:unk/common/common_router.dart';
import 'package:unk/common/text_style.dart';
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
    TextInputAction? textInputAction,
  }) {
    return TextFormField(
      textInputAction: textInputAction,
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
        hintStyle: poppinsLight.copyWith(
          color: hintColor ?? AppColor.default6Color,
          fontSize: fontSize ?? 14.sp,
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
    TextStyle? textStyle,
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
          style: textStyle,
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
    EdgeInsets? padding,
    double? horizontalPadding,
    double? verticalPadding,
  }) {
    if (imagePath.isEmpty) {
      return Center(child: warningIcon(color: color));
    } else if (imagePath.startsWith('https')) {
      if (imagePath.endsWith('svg')) {
        return SvgPicture.network(
          imagePath,
          fit: fit ?? BoxFit.fitWidth,
          width: width,
          height: height,
          colorFilter:
          color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
          placeholderBuilder: (context) => sizedBox(
            height: height,
            width: width,
            child: sizedBox(
              height: height,
              width: width,
              child: loadingIos(),
            ),
          ),
        );
      } else {
        return ClipRRect(
          borderRadius: isBorderOnlySide == true
              ? BorderRadius.only(
            bottomLeft: bottomLeft ?? Radius.zero,
            bottomRight: bottomRight ?? Radius.zero,
            topLeft: topLeft ?? Radius.zero,
            topRight: topRight ?? Radius.zero,
          )
              : BorderRadius.circular(borderRadius ?? 0),
          child: CachedNetworkImage(
            imageUrl: imagePath,
            fit: fit ?? BoxFit.cover,
            memCacheWidth: cacheWidth,
            color: color,
            height: height,
            width: width,
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
        width: width,
        height: height,
        colorFilter:
        color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
      );
    } else if (imagePath.startsWith('assets')) {
      return Padding(
        padding: padding ?? EdgeInsets.zero,
        child: Image.asset(
          imagePath,
          fit: fit ?? BoxFit.fitWidth,
          width: width,
          height: height,
          color: color,
          cacheWidth: cacheWidth,
          errorBuilder: (context, error, stackTrace) =>
              warningIcon(color: color),
        ),
      );
    } else if (imagePath.endsWith('.svg')) {
      return SvgPicture.file(
        File(imagePath),
        fit: fit ?? BoxFit.fitWidth,
        width: width,
        height: height,
        colorFilter:
        color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
      );
    } else {
      return Image.file(
        File(imagePath),
        fit: fit ?? BoxFit.fitWidth,
        width: width,
        height: height,
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
                backgroundColor: AppColor.default6Color,
                strokeCap: StrokeCap.round,
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
          Images.wraning_image,
          width: width ?? 32.w,
          height: height ?? 32.h,
          colorFilter: ColorFilter.mode(
              color ?? AppColor.default1Color, BlendMode.srcIn),
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
