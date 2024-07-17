import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cinex/gen/assets.gen.dart';
import 'package:cinex/core/router/app_routes.dart';
import 'package:cinex/utils/constants/app_constant.dart';
import 'package:cinex/core/theme/app_color.dart';
import 'package:cinex/core/theme/app_textstyle.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
        body: Container(
      height: height,
      color: Colors.black,
      child: Column(
        children: [
          Expanded(
              child: Stack(
            children: [
              SvgPicture.asset(
                Assets.images.background,
                fit: BoxFit.cover,
              ),
              Positioned(
                left: 10,
                right: 10,
                bottom: -80,
                child: Image.asset(
                  Assets.images.welcome.path,
                  scale: 12,
                ),
              )
            ],
          )),
          SafeArea(
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Text(
                    'Khám phá thế giới điện ảnh cùng CineX',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.l1(),
                  ),
                  AppConstants.height30,
                  Text(
                    'Tìm kiếm, đánh giá mọi bộ phim ở mọi nơi mọi lúc, bất cứ khi nào truy cập',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.textStyle(),
                  ),
                  AppConstants.height30,
                  InkWell(
                    onTap: () =>
                        Navigator.pushNamed(context, Routes.navibarCineX),
                    child: Container(
                      height: 65,
                      width: 65,
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: AppColor.primaryColor),
                      child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: Colors.black, width: 2)),
                          child: const Icon(Icons.arrow_forward_ios_rounded)),
                    ),
                  ),
                  AppConstants.height20
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
