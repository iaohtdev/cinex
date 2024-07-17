import 'package:cinex/presentation/cubits/cubits.dart';
import 'package:cinex/presentation/screen/home/widgets/movie_item.dart';
import 'package:cinex/presentation/screen/home/widgets/shimmer_movie.dart';
import 'package:flutter/material.dart';
import 'package:cinex/utils/components/app_constant.dart';
import 'package:cinex/utils/style/app_textstyle.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class KoreaMovies extends StatelessWidget {
  const KoreaMovies({
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
                'Phim và chương trình Hàn Quốc',
                style: AppTextStyles.l3(),
              ),
              AppConstants.height20,
              SizedBox(
                height: 180,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.koreaMovies?.length,
                  itemBuilder: (context, index) {
                    return MovieItem(
                      movie: state.koreaMovies![index],
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
