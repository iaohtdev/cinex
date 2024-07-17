import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinex/gen/assets.gen.dart';
import 'package:cinex/data/config/tmdb.dart';
import 'package:cinex/core/shared/theme/app_color.dart';
import 'package:flutter/material.dart';

class ImageHelper {
  static Widget getNetworkImg(
      {required String? imageUrl,
      double? height,
      double? width,
      Widget? errorWidget,
      BoxFit? fit,
      Color? color,
      Widget? placeholder}) {
    return CachedNetworkImage(
        imageUrl: TMDB.BASE_IMG + (imageUrl ?? ''),
        fit: fit ?? BoxFit.cover,
        color: color,
        width: width,
        placeholder: (context, url) => placeholder ?? Container(),
        errorWidget: (context, url, error) =>
            errorWidget ??
            Container(
              width: double.infinity,
              height: double.infinity,
              color: AppColor.darkWhite,
              padding: EdgeInsets.all(25),
              child: Image.asset(
                Assets.images.logoCinex.path,
                color: Colors.grey,
              ),
            ));
  }
}
