import 'dart:ui';

import 'package:cinex/model/movie_model.dart';
import 'package:cinex/model/tv_model.dart';
import 'package:cinex/utils/helper/image_helper.dart';
import 'package:cinex/utils/style/app_color.dart';
import 'package:cinex/utils/widgets/circular_progress.dart';
import 'package:flutter/material.dart';
import 'package:cinex/utils/components/app_constant.dart';

class BannerDetail extends StatelessWidget {
  const BannerDetail({
    super.key,
    this.movie,
    this.tv,
  });

  final MovieModel? movie;
  final TVModel? tv;
  int get rating => tv != null
      ? ((tv?.voteAverage ?? 0) * 10).toInt()
      : ((movie?.voteAverage ?? 0) * 10).toInt();

  String? get banner => movie != null ? movie?.backdropPath : tv?.backdropPath;
  String? get poster => movie != null ? movie?.posterPath : tv?.posterPath;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      expandedHeight: 270,
      flexibleSpace: FlexibleSpaceBar(
        background: Column(
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
                  right: 20,
                  bottom: -30,
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
        ),
      ),
    );
  }
}
