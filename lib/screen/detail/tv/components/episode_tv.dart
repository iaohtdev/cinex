import 'package:cinex/cubits/cubits.dart';
import 'package:cinex/model/episode_model.dart';
import 'package:cinex/model/tv_model.dart';
import 'package:cinex/utils/common/app_common.dart';
import 'package:cinex/utils/helper/image_helper.dart';
import 'package:cinex/utils/widgets/app_shimmer.dart';
import 'package:cinex/utils/widgets/circular_progress.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:cinex/utils/components/app_constant.dart';
import 'package:cinex/utils/style/app_color.dart';
import 'package:cinex/utils/style/app_textstyle.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EpisodeTVWidget extends StatefulWidget {
  const EpisodeTVWidget({super.key, required this.stateTV});
  final DetailTVsLoaded stateTV;

  @override
  State<EpisodeTVWidget> createState() => _EpisodeTVWidgetState();
}

class _EpisodeTVWidgetState extends State<EpisodeTVWidget> {
  Seasons? seasonSelected;
  TVModel? get tv => widget.stateTV.tv;
  List<Seasons> get seasons => tv?.seasons ?? [];
  @override
  void initState() {
    seasonSelected = seasonSelected == null ? seasons.last : seasonSelected;
    BlocProvider.of<EpisodeCubit>(context).fetchEpisode(
        id: tv?.id ?? 0, seasonNumber: seasonSelected?.seasonNumber ?? 0);
    super.initState();
  }

  void onChangeDropdown(Seasons? value) {
    if (seasonSelected?.seasonNumber != value?.seasonNumber) {
      context.read<EpisodeCubit>().fetchEpisode(
          id: tv?.id ?? 0, seasonNumber: value?.seasonNumber ?? 0);
    }
    setState(() {
      seasonSelected = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppConstants.pHorizontal),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppConstants.height5,
          Align(
            alignment: Alignment.centerRight,
            child: DropdownButtonHideUnderline(
              child: DropdownButton2<Seasons>(
                isExpanded: true,
                customButton: Container(
                  decoration: BoxDecoration(
                      color: AppColor.darkWhite,
                      borderRadius: BorderRadius.circular(5)),
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        seasonSelected?.name ?? '',
                        style: AppTextStyles.textStyleBold(fontSize: 16),
                      ),
                      AppConstants.width4,
                      Icon(
                        Icons.arrow_drop_down,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
                items: seasons
                    .map((Seasons item) => DropdownMenuItem<Seasons>(
                          value: item,
                          child: Text(
                            item.name ?? '',
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ))
                    .toList(),
                value: seasonSelected,
                onChanged: onChangeDropdown,
                buttonStyleData: const ButtonStyleData(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  height: 40,
                  width: 140,
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                ),
              ),
            ),
          ),
          AppConstants.height20,
          BlocBuilder<EpisodeCubit, EpisodeState>(
            builder: (context, state) {
              if (state is EpisodeLoading) {
                return _episodeShimmer();
              } else if (state is EpisodesLoaded) {
                return Column(children: [
                  ...state.episode!.episodes!.map(
                    (e) {
                      int rating = ((e.voteAverage ?? 0) * 10).toInt();
                      return _itemEpisode(e, rating);
                    },
                  ).toList(),
                ]);
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }

  Widget _itemEpisode(Episodes e, int rating) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 4,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Stack(
                          children: [
                            Container(
                              height: 80,
                              child: ImageHelper.getNetworkImg(
                                imageUrl: e.stillPath ?? tv?.backdropPath,
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 80,
                              child: Center(
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.white),
                                      color: Colors.black.withOpacity(0.2)),
                                  child: const Icon(
                                    Icons.play_arrow,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    AppConstants.width20,
                    Expanded(
                        flex: 8,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              e.name ?? '',
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyles.textStyleBold(fontSize: 16),
                            ),
                            Text(
                              AppCommon.formatTime(e.runtime ?? 0),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyles.textStyle(),
                            ),
                          ],
                        ))
                  ],
                ),
              ),
              CircularProgressWithPercentage(
                score: rating,
                size: 30,
                textSize: 10,
                strokeWidth: 4,
              ),
            ],
          ),
          AppConstants.height5,
          Text(
            e.overview!.isNotEmpty
                ? e.overview ?? ''
                : 'Không có bản tóm tắt cho tập phim này',
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.textStyle(fontSize: 12),
          )
        ],
      ),
    );
  }

  Widget _episodeShimmer() {
    return Container(
      height: 250,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: 2,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.only(bottom: 15),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: AppShimmer(
                        height: 85,
                      ),
                    ),
                    AppConstants.width10,
                    Expanded(
                      flex: 8,
                      child: Column(
                        children: [
                          AppShimmer(
                            height: 40,
                          ),
                          AppConstants.height10,
                          AppShimmer(
                            height: 20,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                AppConstants.height10,
                AppShimmer(
                  height: 20,
                  width: double.infinity,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
