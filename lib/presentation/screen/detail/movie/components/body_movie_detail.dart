import 'package:cinex/presentation/cubits/cubits.dart';
import 'package:cinex/core/model/cast_model.dart';
import 'package:cinex/core/model/movie_model.dart';
import 'package:cinex/presentation/screen/detail/widgets/cast_widget.dart';
import 'package:cinex/presentation/screen/detail/widgets/overview_detail.dart';
import 'package:cinex/presentation/screen/detail/widgets/similar_widget.dart';
import 'package:cinex/core/shared/extensions/app_extensions.dart';
import 'package:cinex/presentation/widgets/custom_indicator_tab.dart';
import 'package:flutter/material.dart';
import 'package:cinex/utils/components/app_constant.dart';
import 'package:cinex/core/shared/theme/app_color.dart';
import 'package:cinex/utils/style/app_textstyle.dart';

class BodyMovieDetail extends StatefulWidget {
  const BodyMovieDetail({
    super.key,
    required this.state,
  });
  final DetailMoviesLoaded? state;
  @override
  State<BodyMovieDetail> createState() => _BodyMovieDetailState();
}

class _BodyMovieDetailState extends State<BodyMovieDetail>
    with SingleTickerProviderStateMixin {
  MovieModel? get movie => widget.state?.movies;
  List<MovieModel> get similar => widget.state?.similar ?? [];
  List<CastModel> get casts => widget.state?.casts ?? [];
  int idxTabSelected = 0;
  String get time => (movie?.runtime ?? 0).formatTime();
  String get dateRelesed => (movie?.releaseDate ?? '').formatDateVN();
  String get type {
    if (movie != null && movie!.genres != null) {
      final x =
          movie!.genres!.map((genre) => genre.name!.substring(5)).toList();
      return x.join(', ');
    }
    return '';
  }

  String get vote => '${movie?.voteCount ?? 0} votes';

  late TabController controller;

  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (_, int index) {
          return Column(
            children: [
              _headerBody(),
              AppConstants.height20,
              if (movie?.overview != '')
                OverviewDetail(overview: movie?.overview ?? ''),
              _infoTV()
            ],
          );
        },
        childCount: 1,
      ),
    );
  }

  Widget _headerBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppConstants.pHorizontal),
      child: Row(
        children: [
          Expanded(
            flex: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppConstants.height10,
                Text(
                  movie?.title ?? '',
                  style: AppTextStyles.l3(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                AppConstants.height5,
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: '$dateRelesed •',
                      style: AppTextStyles.textStyle(color: Colors.grey)),
                  TextSpan(
                      text: ' $time',
                      style: AppTextStyles.textStyle(color: Colors.grey)),
                ])),
                AppConstants.height5,
                Text(
                  'Thể loại: $type',
                  style: AppTextStyles.textStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column _infoTV() {
    return Column(
      children: [
        Container(
          height: 1,
          color: AppColor.darkWhite,
        ),
        Container(
          alignment: Alignment.centerLeft,
          child: TabBar(
            controller: controller,
            indicator: CustomTabIndicator(),
            tabAlignment: TabAlignment.start,
            isScrollable: true,
            labelPadding: const EdgeInsets.only(right: 16, left: 20),
            dividerColor: Colors.transparent,
            labelColor: AppColor.white,
            unselectedLabelStyle: AppTextStyles.textStyleBold(fontSize: 15),
            labelStyle: AppTextStyles.textStyleBold(fontSize: 15),
            tabs: [
              Tab(
                text: 'Diễn viên'.toUpperCase(),
              ),
              Tab(
                text: 'Các phim tương tự'.toUpperCase(),
              ),
            ],
            onTap: (idx) {
              setState(() {
                idxTabSelected = idx;
              });
            },
          ),
        ),
        __tabbarView(
          idxTabSelected,
        ),
      ],
    );
  }

  Widget __tabbarView(
    int index,
  ) {
    Widget widget;
    switch (index) {
      case 0:
        widget = CastWidget(
          casts: casts,
        );
        break;
      case 1:
        widget = SimilarWidget(
          movies: similar,
        );
        break;
      default:
        return Container();
    }
    return widget;
  }
}
