import 'package:cinex/presentation/cubits/cubits.dart';
import 'package:cinex/presentation/screen/home/widgets/shimmer_movie.dart';
import 'package:cinex/presentation/screen/home/widgets/tv_item.dart';
import 'package:flutter/material.dart';
import 'package:cinex/utils/components/app_constant.dart';
import 'package:cinex/utils/style/app_textstyle.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TVTrending extends StatelessWidget {
  const TVTrending({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TVCubit, TVState>(
      builder: (context, state) {
        if (state is TVLoading) {
          return const ShimmerMovie();
        } else if (state is TVLoaded) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Series phim phổ biến trong ngày',
                style: AppTextStyles.l3(),
              ),
              AppConstants.height20,
              SizedBox(
                height: 180,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.trendTvDay?.length,
                  itemBuilder: (context, index) {
                    return TVItem(
                      tv: state.trendTvDay![index],
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
