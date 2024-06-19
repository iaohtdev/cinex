import 'package:flutter/material.dart';
import 'package:rate_movie/gen/assets.gen.dart';
import 'package:rate_movie/routers/app_routes.dart';
import 'package:rate_movie/utils/components/app_constant.dart';
import 'package:rate_movie/utils/style/app_textstyle.dart';
import 'package:widget_mask/widget_mask.dart';

class NowPlayingMovie extends StatelessWidget {
  const NowPlayingMovie({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Phim đang chiếu tại rạp ',
          style: AppTextStyles.l3(),
        ),
        AppConstants.height20,
        SizedBox(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              String mask = '';
              if (index == 0) {
                mask = Assets.images.maskFirstIndex.path;
              } else if (index == 9) {
                mask = Assets.images.maskLastIndex.path;
              } else {
                mask = Assets.images.mask.path;
              }
              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Hero(
                  tag: '$index',
                  child: GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, Routes.movieDetail),
                    child: WidgetMask(
                        blendMode: BlendMode.srcATop,
                        childSaveLayer: true,
                        mask: Image.asset(
                          Assets.images.poster1.path,
                          fit: BoxFit.cover,
                        ),
                        child: Image.asset(mask)),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
