import 'package:cinex/cubits/cubits.dart';
import 'package:cinex/screen/home/widgets/movie_item.dart';
import 'package:cinex/screen/home/widgets/shimmer_movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cinex/utils/components/app_constant.dart';
import 'package:cinex/utils/style/app_color.dart';
import 'package:cinex/utils/style/app_textstyle.dart';

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
                height: 190,
                child: TabBarView(controller: controller, children: [
                  ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.trendDay?.length,
                    itemBuilder: (context, index) {
                      return MovieItemWithRank(
                          movie: state.trendDay![index], index: index);
                    },
                  ),
                  ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.trendWeek?.length,
                    itemBuilder: (context, index) {
                      return MovieItemWithRank(
                          movie: state.trendWeek![index], index: index);
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
