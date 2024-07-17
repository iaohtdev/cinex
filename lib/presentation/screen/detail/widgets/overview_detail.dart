import 'package:cinex/utils/components/app_constant.dart';
import 'package:cinex/core/shared/theme/app_color.dart';
import 'package:cinex/utils/style/app_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class OverviewDetail extends StatelessWidget {
  const OverviewDetail({super.key, required this.overview});

  final String overview;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          right: AppConstants.pHorizontal,
          left: AppConstants.pHorizontal,
          bottom: 20),
      child: ReadMoreText(
        overview,
        trimMode: TrimMode.Line,
        trimLines: 3,
        style: AppTextStyles.textStyle(color: Colors.white, fontSize: 16),
        trimCollapsedText: 'đọc thêm',
        trimExpandedText: ' thu gọn',
        moreStyle:
            AppTextStyles.textStyle(color: AppColor.primaryColor, fontSize: 16),
        lessStyle:
            AppTextStyles.textStyle(color: AppColor.primaryColor, fontSize: 16),
      ),
    );
  }
}
