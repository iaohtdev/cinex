import 'package:flutter/material.dart';
import 'package:rate_movie/utils/style/app_color.dart';
import 'package:rate_movie/utils/style/app_textstyle.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {super.key,
      this.title,
      this.style,
      this.padding,
      this.margin,
      this.onTap,
      this.backgroundColor});

  final String? title;
  final TextStyle? style;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Function()? onTap;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding ?? const EdgeInsets.symmetric(vertical: 16),
        margin: margin ?? const EdgeInsets.symmetric(horizontal: 16),
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: backgroundColor != null
                ? null
                : const LinearGradient(
                    colors: [
                      AppColor.primaryColor,
                      AppColor.primaryColor,
                    ],
                  ),
            color: backgroundColor,
            borderRadius: BorderRadius.circular(30)),
        child: Center(
            child: Text(
          title ?? '',
          style: style ??
              AppTextStyles.textStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w700),
        )),
      ),
    );
  }
}
