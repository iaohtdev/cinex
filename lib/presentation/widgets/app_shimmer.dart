import 'package:cinex/core/shared/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AppShimmer extends StatelessWidget {
  const AppShimmer({super.key, this.width, this.height, this.radius});

  final double? width;
  final double? height;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius ?? 16),
      child: SizedBox(
        width: width ?? double.infinity,
        height: height,
        child: Shimmer.fromColors(
            baseColor: Colors.grey.withOpacity(0.2),
            highlightColor: AppColor.darkWhite,
            child: Container(
              color: Colors.cyan,
            )),
      ),
    );
  }
}
