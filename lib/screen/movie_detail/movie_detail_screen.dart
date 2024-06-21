import 'package:cinex/cubits/cubits.dart';
import 'package:cinex/model/movie_model.dart';
import 'package:cinex/utils/widgets/app_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cinex/gen/assets.gen.dart';
import 'package:cinex/screen/movie_detail/widgets/header_widgets.dart';
import 'package:cinex/screen/movie_detail/widgets/info_movie.dart';
import 'package:cinex/utils/components/app_constant.dart';
import 'package:cinex/utils/style/app_textstyle.dart';

class MovieDetailScreen extends StatefulWidget {
  const MovieDetailScreen({
    super.key,
    required this.movie,
  });
  final MovieModel movie;

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _hasScrolledPastAppBar = false;
  final heightSliverAppbar = 220.0;

  MovieModel get movie => widget.movie;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<DetailMovieCubit>(context).fetchDetail(movie.id ?? 0);

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

      if (offset > heightSliverAppbar && !_hasScrolledPastAppBar) {
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
      body: BlocBuilder<DetailMovieCubit, DetailMovieState>(
        builder: (context, state) {
          return CustomScrollView(
            controller: _scrollController,
            slivers: [
              HeaderMovie(
                movie: movie,
              ),
              if (state is DetailMoviesLoading) _shimmer(width),
              if (state is DetailMoviesLoaded) InfoMovie(state: state),
              if (state is DetailMoviesError)
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
                  movie.title ?? '',
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
