import 'package:flutter/material.dart';
import 'package:rate_movie/utils/components/app_constant.dart';
import 'package:rate_movie/utils/style/app_color.dart';
import 'package:rate_movie/utils/style/app_textstyle.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class AppDialog {
  static void showAppDialog(BuildContext context,
      {Color? backgroundColor, Widget? content}) {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        insetPadding: const EdgeInsets.symmetric(
          horizontal: 35,
        ),
        backgroundColor: backgroundColor ?? AppColor.primaryColor,
        child: Wrap(
          children: [
            Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                width: double.infinity,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: content ?? Container()),
          ],
        ),
      ),
    );
  }

  static void showLoadingDialog(BuildContext context,
      {Color? backgroundColor, Widget? content}) {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        insetPadding: const EdgeInsets.symmetric(
          horizontal: 35,
        ),
        backgroundColor: backgroundColor ?? AppColor.primaryColor,
        child: Wrap(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              width: double.infinity,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  AppConstants.height10,
                  LoadingAnimationWidget.flickr(
                    leftDotColor: AppColor.pink,
                    rightDotColor: AppColor.primaryColor,
                    size: 45,
                  ),
                  AppConstants.height20,
                  Text(
                    'Creating...',
                    style: AppTextStyles.textStyleBold(
                        fontSize: 18, color: AppColor.primaryColor),
                  ),
                  AppConstants.height10,
                  Text(
                    'Wait a few minutes, your image is being created',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.textStyleBold(
                        fontSize: 14, color: AppColor.white),
                  ),
                  AppConstants.height10,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
