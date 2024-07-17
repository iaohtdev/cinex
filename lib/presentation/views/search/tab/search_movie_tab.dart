import 'package:cinex/data/models/movie_model.dart';
import 'package:cinex/core/router/app_routes.dart';
import 'package:cinex/utils/extensions/app_extensions.dart';
import 'package:cinex/utils/constants/app_constant.dart';
import 'package:cinex/utils/helper/image_helper.dart';
import 'package:cinex/core/theme/app_textstyle.dart';
import 'package:flutter/material.dart';

class SearchMovieTab extends StatelessWidget {
  const SearchMovieTab({super.key, required this.movies});
  final List<MovieModel> movies;
  @override
  Widget build(BuildContext context) {
    return movies.length == 0
        ? Container(
            child: Center(
              child: Text(
                'Không có kết quả',
                style: AppTextStyles.textStyle(),
              ),
            ),
          )
        : ListView.builder(
            padding: EdgeInsets.only(top: 20, left: 16, right: 16),
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final item = movies[index];

              int idGenre = item.genreIds!.isNotEmpty
                  ? ((item.genreIds?.first) ?? 18)
                  : 18;

              String? overview =
                  item.overview != null && item.overview!.isNotEmpty
                      ? item.overview
                      : 'Không có bản tóm tắt mô tả';

              return Padding(
                padding: const EdgeInsets.only(
                  bottom: 12,
                ),
                child: GestureDetector(
                  onTap: () => Navigator.pushNamed(context, Routes.movieDetail,
                      arguments: {
                        'movie': item,
                      }),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                            height: 100,
                            width: 100,
                            child: ImageHelper.getNetworkImg(
                              imageUrl: item.posterPath ?? item.backdropPath,
                            )),
                      ),
                      AppConstants.width10,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.title ?? '',
                              style: AppTextStyles.textStyleBold(fontSize: 16),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            AppConstants.height4,
                            RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                  text:
                                      '${(item.releaseDate ?? '').formatYear()} • ',
                                  style: AppTextStyles.textStyle(
                                      color: Colors.grey)),
                              TextSpan(
                                  text: '${idGenre.getGenreNameById()}',
                                  style: AppTextStyles.textStyle(
                                      color: Colors.grey)),
                            ])),
                            AppConstants.height4,
                            Text(
                              overview ?? '',
                              style:
                                  AppTextStyles.textStyle(color: Colors.grey),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
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
