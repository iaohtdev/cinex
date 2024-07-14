import 'package:cinex/features/cinex/presentation/cubits/navibar/navibar_cubit.dart';
import 'package:cinex/features/cinex/presentation/routers/app_routes.dart';
import 'package:cinex/utils/common/app_common.dart';
import 'package:cinex/utils/components/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cinex/gen/assets.gen.dart';
import 'package:cinex/core/theme/app_color.dart';
import 'package:cinex/utils/style/app_textstyle.dart';

class AppAppBar extends StatelessWidget implements PreferredSize {
  const AppAppBar({super.key, this.onTap});
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => AppCommon.unfocus(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      AppCommon.unfocus();
                      context.read<NaviBarCubit>().updateIndex(0);
                    },
                    child: Text(
                      'CineX',
                      style: AppTextStyles.textStyleBold(
                          fontSize: 28, color: AppColor.primaryColor),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    Assets.icons.iconNotification,
                    color: Colors.white,
                    height: 25,
                  ),
                  AppConstants.width10,
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, Routes.welcome),
                    child: SvgPicture.asset(
                      Assets.icons.iconSettings,
                      color: Colors.white,
                      height: 25,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
