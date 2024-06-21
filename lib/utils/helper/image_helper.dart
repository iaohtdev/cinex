import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinex/provider/tmdb.dart';
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
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
