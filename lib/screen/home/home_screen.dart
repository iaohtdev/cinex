import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cinex/gen/assets.gen.dart';
import 'package:cinex/screen/home/widgets/now_playing.dart';
import 'package:cinex/screen/home/widgets/type_movie.dart';
import 'package:cinex/screen/home/widgets/upcoming_movie.dart';
import 'package:cinex/utils/components/app_constant.dart';
import 'package:cinex/utils/style/app_color.dart';
import 'package:cinex/utils/style/app_textstyle.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: AppConstants.pHorizontal),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Xem thông tin mọi bộ phim bạn muốn!',
              style: AppTextStyles.l2(),
            ),
            AppConstants.height20,
            Container(
              padding:
                  const EdgeInsets.only(left: 20, right: 3, top: 3, bottom: 3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColor.darkWhite,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tìm kiếm',
                    style: AppTextStyles.textStyle(
                        fontSize: 14, color: Colors.grey),
                  ),
                  Container(
                    height: 45,
                    width: 45,
                    padding: const EdgeInsets.all(13),
                    decoration: const BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: SvgPicture.asset(
                      Assets.icons.iconSearch,
                      color: AppColor.primaryColor,
                    ),
                  )
                ],
              ),
            ),
            AppConstants.height20,
            const TypeMovie(),
            AppConstants.height10,
            const NowPlayingMovie(),
            const UpcomingMovies(),
            AppConstants.height30,
          ],
        ),
      ),
    );
  }
}
