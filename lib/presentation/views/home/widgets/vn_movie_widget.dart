import 'package:cinex/presentation/cubits/cubits.dart';
import 'package:cinex/presentation/views/home/widgets/movie_item.dart';
import 'package:cinex/presentation/views/home/widgets/shimmer_movie.dart';
import 'package:flutter/material.dart';
import 'package:cinex/utils/constants/app_constant.dart';
import 'package:cinex/core/theme/app_textstyle.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VietNamNewMovie extends StatelessWidget {
  const VietNamNewMovie({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiscoverCubit, DiscoverState>(
      builder: (context, state) {
        if (state is DiscoverLoading) {
          return const ShimmerMovie();
        } else if (state is DiscoverLoaded) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Phim Việt Nam dành cho bạn',
                style: AppTextStyles.l3(),
              ),
              AppConstants.height20,
              SizedBox(
                height: 180,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.vnMovies?.length,
                  itemBuilder: (context, index) {
                    return MovieItem(
                      movie: state.vnMovies![index],
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
