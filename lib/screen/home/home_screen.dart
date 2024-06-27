import 'package:cinex/cubits/cubits.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
            AppConstants.height30,
            _search(),
            AppConstants.height30,
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

  Widget _search() {
    return GestureDetector(
      onTap: () => context.read<NaviBarCubit>().updateIndex(1),
      child: Container(
        padding: const EdgeInsets.only(left: 20, right: 4, top: 4, bottom: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColor.darkWhite,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Tên phim, diễn viên, tv series...',
              style: AppTextStyles.textStyle(
                  fontSize: 14, color: AppColor.darkWhite),
            ),
            Container(
              height: 45,
              width: 45,
              padding: const EdgeInsets.all(13),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: SvgPicture.asset(
                Assets.icons.iconSearch,
                color: AppColor.primaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
