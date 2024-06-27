import 'package:cinex/model/movie_model.dart';
import 'package:cinex/utils/helper/image_helper.dart';
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
      expandedHeight: 220,
      flexibleSpace: FlexibleSpaceBar(
        background: Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppConstants.pHorizontal),
                width: MediaQuery.sizeOf(context).width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: ImageHelper.getNetworkImg(
                      imageUrl: movie.backdropPath ?? movie.posterPath),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
