import 'package:flutter/material.dart';
import 'package:rate_movie/gen/assets.gen.dart';
import 'package:rate_movie/routers/app_routes.dart';
import 'package:rate_movie/utils/components/app_constant.dart';
import 'package:rate_movie/utils/style/app_textstyle.dart';

class UpcomingMovies extends StatelessWidget {
  const UpcomingMovies({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Phim sắp chiếu ',
          style: AppTextStyles.l3(),
        ),
        AppConstants.height10,
        SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Hero(
                  tag: '$index',
                  child: GestureDetector(
                      onTap: () =>
                          Navigator.pushNamed(context, Routes.movieDetail),
                      child: Container(
                        margin: const EdgeInsets.only(right: 20),
                        width: 130,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(Assets.images.poster1.path))),
                      )),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
