import 'package:flutter/material.dart';
import 'package:rate_movie/gen/assets.gen.dart';
import 'package:rate_movie/utils/components/app_constant.dart';
import 'package:rate_movie/utils/style/app_color.dart';
import 'package:rate_movie/utils/style/app_textstyle.dart';
import 'package:readmore/readmore.dart';

class InfoMovie extends StatefulWidget {
  const InfoMovie({
    super.key,
  });

  @override
  State<InfoMovie> createState() => _InfoMovieState();
}

class _InfoMovieState extends State<InfoMovie> {
  int idxSelected = 0;
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
                Row(
                  children: [
                    Expanded(
                      flex: 8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppConstants.height10,
                          Text(
                            'Avatar: The way of the Water',
                            style: AppTextStyles.l3(),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          AppConstants.height5,
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: '2022 Released •',
                                style: AppTextStyles.textStyle(
                                    color: Colors.grey)),
                            TextSpan(
                                text: ' Kinh dị •',
                                style: AppTextStyles.textStyle(
                                    color: Colors.grey)),
                            TextSpan(
                                text: ' 3hr 40m 16s',
                                style: AppTextStyles.textStyle(
                                    color: Colors.grey)),
                          ])),
                          AppConstants.height5,
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 18,
                              ),
                              Text(
                                ' 10/10',
                                style:
                                    AppTextStyles.textStyle(color: Colors.grey),
                              ),
                              AppConstants.width20,
                              const Icon(Icons.favorite,
                                  color: Colors.red, size: 18),
                              Text(
                                ' Yêu thích',
                                style:
                                    AppTextStyles.textStyle(color: Colors.grey),
                              ),
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
                            shape: BoxShape.circle,
                            color: AppColor.primaryColor),
                        child: const Icon(
                          Icons.play_arrow,
                          size: 30,
                        ),
                      ),
                    )
                  ],
                ),
                AppConstants.height20,
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 5),
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
                            style: AppTextStyles.textStyle(
                                color: Colors.white, fontSize: 12),
                          )
                        ],
                      ),
                    ),
                    AppConstants.width20,
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 5),
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
                            style: AppTextStyles.textStyle(
                                color: Colors.white, fontSize: 12),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                AppConstants.height20,
                ReadMoreText(
                  'Your design choices are spot on. The color palette is stunning, and the typography is both elegant and functional. Its a winning combination.',
                  trimMode: TrimMode.Line,
                  trimLines: 3,
                  style: AppTextStyles.textStyle(
                      color: Colors.white, fontSize: 16),
                  trimCollapsedText: 'đọc thêm',
                  trimExpandedText: 'thu gọn',
                  moreStyle: AppTextStyles.textStyle(
                      color: AppColor.primaryColor, fontSize: 16),
                  lessStyle: AppTextStyles.textStyle(
                      color: AppColor.primaryColor, fontSize: 16),
                ),
                AppConstants.height20,
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 5),
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
                _cast(),
                AppConstants.height20,
                _moreMovies()
              ],
            ),
          );
        },
        childCount: 1,
      ),
    );
  }

  Widget _moreMovies() {
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
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(right: 20),
                width: 130,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(Assets.images.poster1.path))),
              );
            },
          ),
        ),
        AppConstants.heigthCustom(80),
      ],
    );
  }

  Widget _cast() {
    return SizedBox(
      height: 130,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(right: 25),
            width: 80,
            child: Column(
              children: [
                Container(
                  height: 85,
                  width: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(Assets.images.poster2.path))),
                ),
                AppConstants.height4,
                Text(
                  'Phương Anh',
                  style: AppTextStyles.textStyle(
                    color: Colors.grey,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  'Phanh',
                  style: AppTextStyles.textStyleBold(
                      color: Colors.white, fontSize: 12),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

List<String> lst = ['Diễn viên', 'Đạo điễn & Crew'];
