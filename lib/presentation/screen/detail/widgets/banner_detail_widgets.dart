import 'dart:ui';

import 'package:cinex/core/model/movie_model.dart';
import 'package:cinex/core/model/tv_model.dart';
import 'package:cinex/core/shared/theme/app_color.dart';
import 'package:cinex/presentation/cubits/cubits.dart';
import 'package:cinex/presentation/widgets/app_loading.dart';
import 'package:cinex/presentation/widgets/circular_progress.dart';
import 'package:cinex/utils/components/app_snackbar.dart';
import 'package:cinex/utils/helper/image_helper.dart';
import 'package:flutter/material.dart';
import 'package:cinex/utils/components/app_constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class BannerDetail extends StatefulWidget {
  const BannerDetail({
    super.key,
    this.movie,
    this.tv,
  });

  final MovieModel? movie;
  final TVModel? tv;

  @override
  State<BannerDetail> createState() => _BannerDetailState();
}

class _BannerDetailState extends State<BannerDetail> {
  YoutubePlayerController? videoController;

  int get rating => widget.tv != null
      ? ((widget.tv?.voteAverage ?? 0) * 10).toInt()
      : ((widget.movie?.voteAverage ?? 0) * 10).toInt();

  String? get banner => widget.movie != null
      ? widget.movie?.backdropPath
      : widget.tv?.backdropPath;

  String? get poster =>
      widget.movie != null ? widget.movie?.posterPath : widget.tv?.posterPath;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TrailerCubit(),
      child: BlocConsumer<TrailerCubit, TrailerState>(
        listener: (context, state) {
          if (state is TrailersLoaded) {
            setState(() {
              videoController = YoutubePlayerController.fromVideoId(
                videoId: state.trailer?.key ?? '',
                autoPlay: true,
                params: const YoutubePlayerParams(showFullscreenButton: true),
              );

              videoController?.listen((event) {
                if (event.playerState == PlayerState.ended) {
                  setState(() {
                    videoController = null;
                  });
                }
              });
            });
          }
          if (state is TrailerError) {
            AppSnackBar.errorBar(context,
                title: 'Đã xảy ra lỗi, vui lòng thử lại sau');

            setState(() {
              videoController = null;
            });
          }
        },
        builder: (context, state) {
          return SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: 270,
            flexibleSpace:
                FlexibleSpaceBar(background: _buildContent(context, state)),
          );
        },
      ),
    );
  }

  Widget _buildContent(BuildContext context, TrailerState state) {
    if (state is TrailerLoading) {
      return AppLoading();
    } else if (videoController != null) {
      return _buildYouTubePlayer();
    } else {
      return _buildBannerDetail(context);
    }
  }

  Widget _buildBannerDetail(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 205,
              width: MediaQuery.sizeOf(context).width,
              child: ImageHelper.getNetworkImg(
                  imageUrl: banner, fit: BoxFit.fitWidth),
            ),
            Positioned(
              bottom: -20,
              right: 0,
              left: 0,
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                  child: Container(height: 30, color: Colors.transparent),
                ),
              ),
            ),
            Container(
              height: 205,
              width: MediaQuery.sizeOf(context).width,
              color: Colors.black.withOpacity(0.3),
            ),
            Positioned(
              bottom: -60,
              left: AppConstants.pHorizontal,
              child: Container(
                width: 120,
                height: 170,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: ImageHelper.getNetworkImg(
                    imageUrl: poster,
                  ),
                ),
              ),
            ),
            Positioned(
              right: 20,
              bottom: -30,
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  print('object');
                  context
                      .read<TrailerCubit>()
                      .fetchTrailer(id: widget.movie?.id ?? widget.tv?.id ?? 0);
                },
                child: Container(
                  width: 60,
                  height: 60,
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: AppColor.primaryColor),
                  child: const Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ),
          ],
        ),
        AppConstants.height10,
        Padding(
          padding: const EdgeInsets.only(left: 150),
          child: Row(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressWithPercentage(
                      score: rating,
                      size: 30,
                      textSize: 10,
                      strokeWidth: 4,
                    ),
                  ],
                ),
              ),
              AppConstants.width10,
              Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.add,
                  size: 22,
                  color: Colors.white,
                ),
              ),
              AppConstants.width10,
              Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.share_outlined,
                  size: 22,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildYouTubePlayer() {
    return Container(
      height: 270,
      width: MediaQuery.sizeOf(context).width,
      child: YoutubePlayer(
        controller: videoController!,
      ),
    );
  }
}
