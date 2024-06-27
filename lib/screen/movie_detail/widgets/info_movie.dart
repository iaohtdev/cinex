import 'package:cinex/cubits/cubits.dart';
import 'package:cinex/model/cast_model.dart';
import 'package:cinex/model/movie_model.dart';
import 'package:cinex/screen/home/widgets/movie_item.dart';
import 'package:cinex/utils/common/app_common.dart';
import 'package:cinex/utils/helper/image_helper.dart';
import 'package:flutter/material.dart';
import 'package:cinex/utils/components/app_constant.dart';
import 'package:cinex/utils/style/app_color.dart';
import 'package:cinex/utils/style/app_textstyle.dart';
import 'package:readmore/readmore.dart';

class InfoMovie extends StatefulWidget {
  const InfoMovie({
    super.key,
    required this.state,
  });
  final DetailMoviesLoaded? state;
  @override
  State<InfoMovie> createState() => _InfoMovieState();
}

class _InfoMovieState extends State<InfoMovie> {
  MovieModel? get movie => widget.state?.movies;
  List<MovieModel> get lstRcm => widget.state?.lstRcm ?? [];
  List<CastModel> get casts => widget.state?.casts ?? [];
  int idxSelected = 0;

  String get time => AppCommon.formatTime(movie?.runtime ?? 0);
  String get dateRelesed => AppCommon.formatDateVN(movie?.releaseDate ?? '');
  String get type {
    if (movie != null && movie!.genres != null) {
      final x =
          movie!.genres!.map((genre) => genre.name!.substring(5)).toList();
      return x.join(', ');
    }
    return '';
  }

  String get rating => (movie?.voteAverage ?? 0).toStringAsFixed(1);
  String get vote => '${movie?.voteCount ?? 0} votes';

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (_, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.pHorizontal),
            child: Column(
              children: [
                _name(),
                AppConstants.height20,
                _option(),
                AppConstants.height20,
                if (movie?.overview != '') _des(),
                _cast(),
                AppConstants.height20,
                if (lstRcm.isNotEmpty) _rcmMovies()
              ],
            ),
          );
        },
        childCount: 1,
      ),
    );
  }

  Column _des() {
    return Column(
      children: [
        ReadMoreText(
          movie?.overview ?? '',
          trimMode: TrimMode.Line,
          trimLines: 3,
          style: AppTextStyles.textStyle(color: Colors.white, fontSize: 16),
          trimCollapsedText: 'đọc thêm',
          trimExpandedText: ' thu gọn',
          moreStyle: AppTextStyles.textStyle(
              color: AppColor.primaryColor, fontSize: 16),
          lessStyle: AppTextStyles.textStyle(
              color: AppColor.primaryColor, fontSize: 16),
        ),
        AppConstants.height20,
      ],
    );
  }

  Row _option() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(14)),
          child: Row(
            children: [
              const Icon(
                Icons.add,
                size: 20,
                color: Colors.white,
              ),
              AppConstants.width2,
              Text(
                'Xem sau',
                style:
                    AppTextStyles.textStyle(color: Colors.white, fontSize: 12),
              )
            ],
          ),
        ),
        AppConstants.width20,
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(14)),
          child: Row(
            children: [
              const Icon(
                Icons.download,
                size: 20,
                color: Colors.white,
              ),
              AppConstants.width2,
              Text(
                'Tải xuống',
                style:
                    AppTextStyles.textStyle(color: Colors.white, fontSize: 12),
              )
            ],
          ),
        ),
      ],
    );
  }

  Row _name() {
    return Row(
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
              AppConstants.height5,
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 18,
                  ),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: '$rating / ',
                        style: AppTextStyles.textStyle(color: Colors.grey)),
                    TextSpan(
                        text: vote,
                        style: AppTextStyles.textStyle(
                            color: Colors.grey, fontSize: 15))
                  ])),
                ],
              )
            ],
          ),
        ),
        AppConstants.width20,
        Expanded(
          flex: 2,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: AppColor.primaryColor),
            child: const Icon(
              Icons.play_arrow,
              size: 30,
            ),
          ),
        )
      ],
    );
  }

  Widget _rcmMovies() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Cùng thể loại',
          style: AppTextStyles.l3(),
        ),
        AppConstants.height10,
        SizedBox(
          height: 180,
          child: ListView.builder(
            itemCount: lstRcm.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return MovieItem(movie: lstRcm[index]);
            },
          ),
        ),
        AppConstants.heigthCustom(80),
      ],
    );
  }

  Widget _cast() {
    return Column(
      children: [
        Row(
            children: lst.asMap().entries.map(
          (e) {
            int idx = e.key;
            return GestureDetector(
              onTap: () {
                setState(() {
                  idxSelected = idx;
                });
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: idxSelected == idx
                          ? AppColor.primaryColor
                          : Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(24)),
                child: Text(
                  e.value,
                  style: AppTextStyles.textStyle(
                    color: idxSelected == idx
                        ? AppColor.primaryColor
                        : Colors.grey,
                  ),
                ),
              ),
            );
          },
        ).toList()),
        AppConstants.height20,
        SizedBox(
          height: idxSelected == 0
              ? casts.isNotEmpty
                  ? 130
                  : 0
              : movie!.productionCompanies!.isNotEmpty
                  ? 70
                  : 0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: idxSelected == 0
                ? casts.length
                : movie?.productionCompanies?.length ?? 0,
            itemBuilder: (context, index) {
              String? img = idxSelected == 0
                  ? casts[index].profilePath
                  : movie?.productionCompanies?[index].logoPath ?? '';

              String name = idxSelected == 0
                  ? casts[index].character ?? ''
                  : movie?.productionCompanies?[index].name ?? '';
              return Container(
                margin: const EdgeInsets.only(right: 25),
                width: 80,
                child: Column(
                  children: [
                    idxSelected == 0
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: SizedBox(
                              height: 85,
                              width: 80,
                              child: ImageHelper.getNetworkImg(imageUrl: img),
                            ),
                          )
                        : SizedBox(
                            height: 40,
                            child: ImageHelper.getNetworkImg(
                                fit: BoxFit.fitWidth,
                                imageUrl: img,
                                color: Colors.white),
                          ),
                    AppConstants.height4,
                    if (idxSelected == 0)
                      Text(
                        casts[index].name ?? '',
                        style: AppTextStyles.textStyle(
                          color: Colors.grey,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    Text(
                      name,
                      style: AppTextStyles.textStyleBold(
                          color: Colors.white, fontSize: 12),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

List<String> lst = ['Diễn viên', 'Công ty sản xuất'];
