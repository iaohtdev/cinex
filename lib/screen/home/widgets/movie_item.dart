import 'package:flutter/material.dart';
import 'package:rate_movie/gen/assets.gen.dart';
import 'package:rate_movie/routers/app_routes.dart';
import 'package:rate_movie/utils/components/app_constant.dart';
import 'package:rate_movie/utils/style/app_textstyle.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, Routes.movieDetail),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Hero(
              tag: '$index',
              child: Container(
                padding: const EdgeInsets.only(right: 25, top: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.asset(
                    Assets.images.poster1.path,
                    width: MediaQuery.sizeOf(context).width * 0.8,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Text(
            'My wife',
            style: AppTextStyles.l3(),
          ),
          Row(
            children: [
              Text(
                '3hr 40m 16s',
                style: AppTextStyles.textStyle(color: Colors.grey),
              ),
              AppConstants.width20,
              const Icon(
                Icons.star,
                color: Colors.yellow,
                size: 18,
              ),
              Text(
                '10/10',
                style: AppTextStyles.textStyle(color: Colors.grey),
              ),
            ],
          )
        ],
      ),
    );
  }
}
