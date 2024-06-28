import 'package:cinex/cubits/cubits.dart';
import 'package:cinex/screen/home/widgets/movie_item.dart';
import 'package:cinex/screen/home/widgets/shimmer_movie.dart';
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

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
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
            TrendingMovie(),
            AppConstants.height30,
            const NowPlayingMovie(),
            AppConstants.height10,
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

class TrendingMovie extends StatefulWidget {
  const TrendingMovie({
    super.key,
  });

  @override
  State<TrendingMovie> createState() => _TrendingMovieState();
}

class _TrendingMovieState extends State<TrendingMovie>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesCubit, MoviesState>(
      builder: (context, state) {
        if (state is MoviesLoading) {
          return const ShimmerMovie();
        } else if (state is MoviesLoaded) {
          return Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Xu hướng',
                    style: AppTextStyles.l3(),
                  ),
                  AppConstants.width20,
                  Container(
                    width: 150,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: AppColor.primaryColor),
                    ),
                    child: TabBar(
                        padding: EdgeInsets.zero,
                        indicatorPadding: EdgeInsets.zero,
                        labelPadding: EdgeInsets.zero,
                        indicatorWeight: 4,
                        indicator: BoxDecoration(
                            color: AppColor.primaryColor,
                            borderRadius: BorderRadius.circular(30)),
                        dividerColor: Colors.transparent,
                        labelColor: AppColor.white,
                        unselectedLabelStyle: AppTextStyles.textStyle(),
                        labelStyle: AppTextStyles.textStyleBold(),
                        controller: controller,
                        tabs: [
                          Tab(
                            child: Container(
                                width: double.infinity,
                                child: Center(child: Text('Ngày'))),
                          ),
                          Tab(
                            child: Container(
                                width: double.infinity,
                                child: Center(child: Text('Tuần'))),
                          ),
                        ]),
                  ),
                ],
              ),
              AppConstants.height20,
              SizedBox(
                height: 180,
                child: TabBarView(controller: controller, children: [
                  ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.trendDay?.length,
                    itemBuilder: (context, index) {
                      return MovieItem(
                        movie: state.trendDay![index],
                      );
                    },
                  ),
                  ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.trendWeek?.length,
                    itemBuilder: (context, index) {
                      return MovieItem(
                        movie: state.trendWeek![index],
                      );
                    },
                  ),
                ]),
              )
            ],
          );
        }
        return Container();
      },
    );
  }
}
