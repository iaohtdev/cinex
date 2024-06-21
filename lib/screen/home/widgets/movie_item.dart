import 'package:cinex/model/movie_model.dart';
import 'package:cinex/utils/common/app_common.dart';
import 'package:cinex/utils/helper/image_helper.dart';
import 'package:cinex/utils/widgets/circular_progress.dart';
import 'package:flutter/material.dart';
import 'package:cinex/routers/app_routes.dart';
import 'package:cinex/utils/components/app_constant.dart';
import 'package:cinex/utils/style/app_textstyle.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({
    super.key,
    required this.movie,
  });
  final MovieModel movie;

  int get rating => ((movie.voteAverage ?? 0) * 10).toInt();
  int get idGenre => (movie.genreIds?.first) ?? 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: GestureDetector(
          onTap: () =>
              Navigator.pushNamed(context, Routes.movieDetail, arguments: {
                'movie': movie,
              }),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: SizedBox(
                  width: 130,
                  child: ImageHelper.getNetworkImg(
                      imageUrl: movie.posterPath ?? '',
                      placeholder: Container(
                        height: 180,
                        width: 130,
                        color: Colors.grey,
                      )),
                ),
              ),
              Positioned(
                  top: 2,
                  right: 2,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.black.withOpacity(0.7),
                    ),
                    child: Text(
                      AppCommon.getGenreNameById(idGenre),
                      style: AppTextStyles.textStyle(fontSize: 10),
                    ),
                  )),
            ],
          )),
    );
  }
}

class MovieTabItem extends StatelessWidget {
  const MovieTabItem({
    super.key,
    required this.lst,
  });
  final List<MovieModel> lst;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: lst.length,
      itemBuilder: (context, index) {
        final item = lst[index];
        int rating = ((item.voteAverage ?? 0) * 10).toInt();
        List lstGener = AppCommon.getGenreNamesByIds(item.genreIds ?? []);
        return Container(
          width: MediaQuery.sizeOf(context).width * 0.8,
          margin: const EdgeInsets.only(right: 20),
          child: GestureDetector(
            onTap: () => Navigator.pushNamed(context, Routes.movieDetail,
                arguments: {'movie': item}),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Stack(
                    children: [
                      Hero(
                        tag: '${item.id}',
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: ImageHelper.getNetworkImg(
                            imageUrl: item.backdropPath,
                            width: double.infinity,
                          ),
                        ),
                      ),
                      Positioned(
                          top: 10,
                          right: 10,
                          child: CircularProgressWithPercentage(
                            score: rating,
                            size: 35,
                          ))
                    ],
                  ),
                ),
                AppConstants.height5,
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.textStyleBold(fontSize: 18),
                      ),
                      Text(
                        lstGener.join(','),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.textStyle(color: Colors.grey),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
