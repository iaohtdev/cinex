import 'package:cinex/cubits/cubits.dart';
import 'package:cinex/model/cast_model.dart';
import 'package:cinex/model/tv_model.dart';
import 'package:cinex/screen/detail/tv/components/episode_tv.dart';
import 'package:cinex/screen/detail/widgets/cast_widget.dart';
import 'package:cinex/screen/detail/widgets/overview_detail.dart';
import 'package:cinex/screen/detail/widgets/similar_widget.dart';
import 'package:cinex/utils/common/app_common.dart';
import 'package:cinex/utils/widgets/custom_indicator_tab.dart';
import 'package:flutter/material.dart';
import 'package:cinex/utils/components/app_constant.dart';
import 'package:cinex/utils/style/app_color.dart';
import 'package:cinex/utils/style/app_textstyle.dart';
import 'package:readmore/readmore.dart';

class BodyTVDetail extends StatefulWidget {
  const BodyTVDetail({
    super.key,
    required this.state,
  });
  final DetailTVsLoaded state;
  @override
  State<BodyTVDetail> createState() => _BodyTVDetailState();
}

class _BodyTVDetailState extends State<BodyTVDetail>
    with SingleTickerProviderStateMixin {
  Seasons? seasonSelected;
  TVModel? get tv => widget.state.tv;
  List<TVModel> get similars => widget.state.similars ?? [];
  List<CastModel> get casts => widget.state.casts ?? [];
  int idxTabSelected = 0;

  String get dateRelesed => AppCommon.formatDateVN(tv?.firstAirDate ?? '');
  String get type {
    if (tv != null && tv!.genres != null) {
      final x = tv!.genres!.map((genre) => genre.name).toList();
      return x.join(', ');
    }
    return '';
  }

  late TabController controller;

  @override
  void initState() {
    controller = TabController(length: 3, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (_, int index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _headerBody(),
              AppConstants.height20,
              if (tv?.overview != '')
                OverviewDetail(overview: tv?.overview ?? ''),
              _infoTV(),
            ],
          );
        },
        childCount: 1,
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
        TabBar(
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
              text: 'TẬP PHIM',
            ),
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
        __tabbarView(idxTabSelected, widget.state),
      ],
    );
  }

  Widget __tabbarView(int index, DetailTVsLoaded state) {
    Widget widget;
    switch (index) {
      case 0:
        widget = EpisodeTVWidget(
          stateTV: state,
        );
        break;
      case 1:
        widget = CastWidget(
          casts: casts,
        );
        break;
      case 2:
        widget = SimilarWidget(
          tv: similars,
        );
        break;
      default:
        return Container();
    }
    return widget;
  }

  Widget _des() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppConstants.pHorizontal),
      child: ReadMoreText(
        tv?.overview ?? '',
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
                  tv?.name ?? '',
                  style: AppTextStyles.l3(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                AppConstants.height5,
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: 'Ngày phát hành: $dateRelesed',
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
}
