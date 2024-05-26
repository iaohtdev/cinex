import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rate_movie/gen/assets.gen.dart';
import 'package:rate_movie/utils/style/app_color.dart';
import 'package:rate_movie/utils/style/app_textstyle.dart';

class AppAppBar extends StatelessWidget implements PreferredSize {
  const AppAppBar({super.key, this.onTap});
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  'CineX',
                  style: AppTextStyles.textStyleBold(
                      fontSize: 28, color: AppColor.primaryColor),
                )
              ],
            ),
            SvgPicture.asset(
              Assets.icons.iconNotification,
              color: Colors.white,
              height: 25,
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
