import 'package:cinex/cubits/cubits.dart';
import 'package:cinex/screen/home/widgets/movie_item.dart';
import 'package:cinex/screen/home/widgets/shimmer_movie.dart';
import 'package:flutter/material.dart';
import 'package:cinex/utils/components/app_constant.dart';
import 'package:cinex/utils/style/app_textstyle.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NowPlayingMovie extends StatelessWidget {
  const NowPlayingMovie({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesCubit, MoviesState>(
      builder: (context, state) {
        if (state is MoviesLoading) {
          return const ShimmerMovie();
        } else if (state is MoviesLoaded) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Phim đang chiếu tại rạp ',
                style: AppTextStyles.l3(),
              ),
              AppConstants.height20,
              SizedBox(
                height: 180,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.nowPlaying?.length,
                  itemBuilder: (context, index) {
                    return MovieItem(
                      movie: state.nowPlaying![index],
                    );
                  },
                ),
              ),
              AppConstants.height30,
            ],
          );
        }
        return Container();
      },
    );
  }
}
