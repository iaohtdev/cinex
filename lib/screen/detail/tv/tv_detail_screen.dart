import 'package:cinex/cubits/cubits.dart';
import 'package:cinex/model/tv_model.dart';
import 'package:cinex/screen/detail/widgets/banner_detail_widgets.dart';
import 'package:cinex/screen/detail/tv/components/body_tv_detail.dart';
import 'package:cinex/utils/widgets/app_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cinex/gen/assets.gen.dart';
import 'package:cinex/utils/components/app_constant.dart';
import 'package:cinex/utils/style/app_textstyle.dart';

class TvDetailScreen extends StatefulWidget {
  const TvDetailScreen({
    super.key,
    required this.tv,
  });
  final TVModel tv;

  @override
  State<TvDetailScreen> createState() => _TvDetailScreenState();
}

class _TvDetailScreenState extends State<TvDetailScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _hasScrolledPastAppBar = false;
  final heightSliverAppbar = 265.0;

  TVModel get tv => widget.tv;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<DetailTVCubit>(context).fetchDetail(tv.id ?? 0);

    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.hasClients) {
      final double offset = _scrollController.offset;

      if (offset > heightSliverAppbar + 50 && !_hasScrolledPastAppBar) {
        setState(() {
          _hasScrolledPastAppBar = true;
        });
      } else if (offset <= heightSliverAppbar && _hasScrolledPastAppBar) {
        setState(() {
          _hasScrolledPastAppBar = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [_appbar(context)],
      ),
      body: BlocBuilder<DetailTVCubit, DetailTVState>(
        builder: (context, state) {
          return CustomScrollView(
            controller: _scrollController,
            slivers: [
              BannerDetail(
                tv: tv,
              ),
              if (state is DetailTVLoading) _shimmer(width),
              if (state is DetailTVsLoaded) BodyTVDetail(state: state),
              if (state is DetailTVError)
                SliverFillRemaining(
                  child: Center(
                    child: Text(
                      state.message,
                      style: AppTextStyles.textStyle(),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  SliverList _shimmer(double width) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (_, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.pHorizontal),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppConstants.height30,
                const AppShimmer(
                  height: 20,
                  width: double.infinity,
                ),
                AppConstants.height10,
                AppShimmer(
                  height: 20,
                  width: width - 100,
                ),
                AppConstants.height14,
                AppConstants.height14,
                Row(
                  children: [
                    AppShimmer(
                      height: 30,
                      width: width / 2.5,
                    ),
                    AppConstants.width10,
                    AppShimmer(
                      height: 30,
                      width: width / 2.5,
                    ),
                  ],
                ),
                AppConstants.height20,
                AppShimmer(
                  height: 120,
                  width: width,
                ),
                AppConstants.height20,
                SizedBox(
                  height: 180,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return const Padding(
                        padding: EdgeInsets.only(right: 15),
                        child: AppShimmer(
                          height: 180,
                          width: 130,
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          );
        },
        childCount: 1,
      ),
    );
  }

  Container _appbar(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      padding: const EdgeInsets.symmetric(horizontal: AppConstants.pHorizontal),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: SvgPicture.asset(
              Assets.icons.iconArrowLeft,
              color: Colors.white,
            ),
          ),
          if (_hasScrolledPastAppBar)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  tv.name ?? '',
                  style: AppTextStyles.l3(),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          SvgPicture.asset(
            Assets.icons.iconBookmark,
            color: Colors.white,
            height: 22,
          ),
        ],
      ),
    );
  }
}
