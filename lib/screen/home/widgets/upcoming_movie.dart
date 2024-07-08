import 'package:cinex/cubits/cubits.dart';
import 'package:cinex/screen/home/widgets/movie_item.dart';
import 'package:cinex/screen/home/widgets/shimmer_movie.dart';
import 'package:flutter/material.dart';
import 'package:cinex/utils/components/app_constant.dart';
import 'package:cinex/utils/style/app_textstyle.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpcomingMovies extends StatelessWidget {
  const UpcomingMovies({
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
                'Phim sắp chiếu',
                style: AppTextStyles.l3(),
              ),
              AppConstants.height20,
              SizedBox(
                height: 180,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.upcoming?.length,
                  itemBuilder: (context, index) {
                    return MovieItem(
                      movie: state.upcoming![index],
                    );
                  },
                ),
              ),
            ],
          );
        }
        return Container();
      },
    );
  }
}
