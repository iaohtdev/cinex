import 'package:cinex/utils/style/app_color.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({super.key, this.size});
  final double? size;
  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.flickr(
      leftDotColor: AppColor.primaryColor,
      rightDotColor: AppColor.pink,
      size: size ?? 40,
    );
  }
}
