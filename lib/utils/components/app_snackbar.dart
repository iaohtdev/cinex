import 'package:flutter/material.dart';
import 'package:cinex/utils/components/app_constant.dart';
import 'package:cinex/utils/style/app_color.dart';
import 'package:cinex/utils/style/app_textstyle.dart';

class AppSnackBar {
  static void errorBar(BuildContext context, {String? title}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 2),
      content: Row(children: [
        const Icon(Icons.error, color: AppColor.white),
        AppConstants.width10,
        Expanded(
            child: Text(
          title ?? 'Error',
          style: AppTextStyles.textStyleBold(color: AppColor.white),
        )),
      ]),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      backgroundColor: Colors.red,
    ));
  }

  static void successBar(BuildContext context, {String? title}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 2),
      content: Row(children: [
        const Icon(Icons.check, color: AppColor.white),
        AppConstants.width10,
        Expanded(
            child: Text(
          title ?? 'Successful',
          style: AppTextStyles.textStyleBold(color: AppColor.white),
        )),
      ]),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      backgroundColor: AppColor.primaryColor,
    ));
  }

  static void warningBar(BuildContext context, {String? title}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          duration: const Duration(seconds: 2),
          content: Row(children: [
            const Icon(Icons.warning, color: AppColor.white),
            AppConstants.width10,
            Expanded(
                child: Text(
              title ?? 'Warning',
              style: AppTextStyles.textStyleBold(color: AppColor.white),
            )),
          ]),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          backgroundColor: const Color.fromARGB(255, 248, 159, 27)),
    );
  }
}
