import 'package:cinex/model/movie_model.dart';
import 'package:cinex/utils/helper/image_helper.dart';
import 'package:cinex/utils/style/app_color.dart';
import 'package:flutter/material.dart';
import 'package:cinex/utils/components/app_constant.dart';

class HeaderMovie extends StatelessWidget {
  const HeaderMovie({
    super.key,
    required this.movie,
  });

  final MovieModel movie;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      expandedHeight: 210,
      flexibleSpace: FlexibleSpaceBar(
        background: Column(
          children: [
            Container(
              height: 205,
              padding: const EdgeInsets.symmetric(
                  horizontal: AppConstants.pHorizontal),
              width: MediaQuery.sizeOf(context).width,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: ImageHelper.getNetworkImg(
                        imageUrl: movie.backdropPath ?? movie.posterPath),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.black.withOpacity(0.2),
                    ),
                    width: MediaQuery.sizeOf(context).width,
                    child: Center(
                      child: Container(
                        width: 60,
                        height: 60,
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColor.primaryColor),
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
            ),
          ],
        ),
      ),
    );
  }
}
