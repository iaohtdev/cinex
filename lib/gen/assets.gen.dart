/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/icon_arrow_left.svg
  String get iconArrowLeft => 'assets/icons/icon_arrow_left.svg';

  /// File path: assets/icons/icon_bookmark.svg
  String get iconBookmark => 'assets/icons/icon_bookmark.svg';

  /// File path: assets/icons/icon_chat.svg
  String get iconChat => 'assets/icons/icon_chat.svg';

  /// File path: assets/icons/icon_home.svg
  String get iconHome => 'assets/icons/icon_home.svg';

  /// File path: assets/icons/icon_menu.svg
  String get iconMenu => 'assets/icons/icon_menu.svg';

  /// File path: assets/icons/icon_notification.svg
  String get iconNotification => 'assets/icons/icon_notification.svg';

  /// File path: assets/icons/icon_search.svg
  String get iconSearch => 'assets/icons/icon_search.svg';

  /// File path: assets/icons/icon_settings.svg
  String get iconSettings => 'assets/icons/icon_settings.svg';

  /// File path: assets/icons/icon_user.svg
  String get iconUser => 'assets/icons/icon_user.svg';

  /// List of all assets
  List<String> get values => [
        iconArrowLeft,
        iconBookmark,
        iconChat,
        iconHome,
        iconMenu,
        iconNotification,
        iconSearch,
        iconSettings,
        iconUser
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/background.svg
  String get background => 'assets/images/background.svg';

  /// File path: assets/images/blur.svg
  String get blur => 'assets/images/blur.svg';

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/logo_cinex.png
  AssetGenImage get logoCinex =>
      const AssetGenImage('assets/images/logo_cinex.png');

  /// File path: assets/images/logo_gif.gif
  AssetGenImage get logoGif =>
      const AssetGenImage('assets/images/logo_gif.gif');

  /// File path: assets/images/poster_1.jpeg
  AssetGenImage get poster1 =>
      const AssetGenImage('assets/images/poster_1.jpeg');

  /// File path: assets/images/poster_2.JPG
  AssetGenImage get poster2 =>
      const AssetGenImage('assets/images/poster_2.JPG');

  /// File path: assets/images/searching.svg
  String get searching => 'assets/images/searching.svg';

  /// File path: assets/images/test.svg
  String get test => 'assets/images/test.svg';

  /// File path: assets/images/welcome.png
  AssetGenImage get welcome => const AssetGenImage('assets/images/welcome.png');

  /// List of all assets
  List<dynamic> get values => [
        background,
        blur,
        logo,
        logoCinex,
        logoGif,
        poster1,
        poster2,
        searching,
        test,
        welcome
      ];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size = null});

  final String _assetName;

  final Size? size;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
