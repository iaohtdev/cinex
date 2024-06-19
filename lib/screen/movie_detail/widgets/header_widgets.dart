import 'package:flutter/material.dart';
import 'package:rate_movie/gen/assets.gen.dart';
import 'package:rate_movie/utils/components/app_constant.dart';

class HeaderMovie extends StatelessWidget {
  const HeaderMovie({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      expandedHeight: 220,
      flexibleSpace: FlexibleSpaceBar(
        background: Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppConstants.pHorizontal),
                width: MediaQuery.sizeOf(context).width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Hero(
                    tag: 'dashs',
                    child: Image.asset(
                      Assets.images.poster1.path,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
