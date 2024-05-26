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

  /// File path: assets/icons/icon_arrow_right.svg
  String get iconArrowRight => 'assets/icons/icon_arrow_right.svg';

  /// File path: assets/icons/icon_bookmark.svg
  String get iconBookmark => 'assets/icons/icon_bookmark.svg';

  /// File path: assets/icons/icon_bookmark_bold.svg
  String get iconBookmarkBold => 'assets/icons/icon_bookmark_bold.svg';

  /// File path: assets/icons/icon_chat.svg
  String get iconChat => 'assets/icons/icon_chat.svg';

  /// File path: assets/icons/icon_crown.svg
  String get iconCrown => 'assets/icons/icon_crown.svg';

  /// File path: assets/icons/icon_dowload.svg
  String get iconDowload => 'assets/icons/icon_dowload.svg';

  /// File path: assets/icons/icon_explode.svg
  String get iconExplode => 'assets/icons/icon_explode.svg';

  /// File path: assets/icons/icon_image_to_image.svg
  String get iconImageToImage => 'assets/icons/icon_image_to_image.svg';

  /// File path: assets/icons/icon_log_out.svg
  String get iconLogOut => 'assets/icons/icon_log_out.svg';

  /// File path: assets/icons/icon_menu.svg
  String get iconMenu => 'assets/icons/icon_menu.svg';

  /// File path: assets/icons/icon_multi_prompt.svg
  String get iconMultiPrompt => 'assets/icons/icon_multi_prompt.svg';

  /// File path: assets/icons/icon_notification.svg
  String get iconNotification => 'assets/icons/icon_notification.svg';

  /// File path: assets/icons/icon_search.svg
  String get iconSearch => 'assets/icons/icon_search.svg';

  /// File path: assets/icons/icon_share.svg
  String get iconShare => 'assets/icons/icon_share.svg';

  /// File path: assets/icons/icon_share_bold.svg
  String get iconShareBold => 'assets/icons/icon_share_bold.svg';

  /// File path: assets/icons/icon_text_to_image.svg
  String get iconTextToImage => 'assets/icons/icon_text_to_image.svg';

  /// File path: assets/icons/icon_up_scalling.svg
  String get iconUpScalling => 'assets/icons/icon_up_scalling.svg';

  /// List of all assets
  List<String> get values => [
        iconArrowLeft,
        iconArrowRight,
        iconBookmark,
        iconBookmarkBold,
        iconChat,
        iconCrown,
        iconDowload,
        iconExplode,
        iconImageToImage,
        iconLogOut,
        iconMenu,
        iconMultiPrompt,
        iconNotification,
        iconSearch,
        iconShare,
        iconShareBold,
        iconTextToImage,
        iconUpScalling
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/background.jpg
  AssetGenImage get background =>
      const AssetGenImage('assets/images/background.jpg');

  /// File path: assets/images/background2.jpeg
  AssetGenImage get background2 =>
      const AssetGenImage('assets/images/background2.jpeg');

  /// File path: assets/images/blur.svg
  String get blur => 'assets/images/blur.svg';

  /// File path: assets/images/blur_home.svg
  String get blurHome => 'assets/images/blur_home.svg';

  /// File path: assets/images/colorful_style.png
  AssetGenImage get colorfulStyle =>
      const AssetGenImage('assets/images/colorful_style.png');

  /// File path: assets/images/cyberpunk_style.png
  AssetGenImage get cyberpunkStyle =>
      const AssetGenImage('assets/images/cyberpunk_style.png');

  /// File path: assets/images/fantasy_style.png
  AssetGenImage get fantasyStyle =>
      const AssetGenImage('assets/images/fantasy_style.png');

  /// File path: assets/images/impressionist_style.png
  AssetGenImage get impressionistStyle =>
      const AssetGenImage('assets/images/impressionist_style.png');

  /// File path: assets/images/minimalist_style.png
  AssetGenImage get minimalistStyle =>
      const AssetGenImage('assets/images/minimalist_style.png');

  /// File path: assets/images/pop_style.png
  AssetGenImage get popStyle =>
      const AssetGenImage('assets/images/pop_style.png');

  /// File path: assets/images/profile-bg3.jpg
  AssetGenImage get profileBg3 =>
      const AssetGenImage('assets/images/profile-bg3.jpg');

  /// File path: assets/images/realistic_style.png
  AssetGenImage get realisticStyle =>
      const AssetGenImage('assets/images/realistic_style.png');

  /// File path: assets/images/success.svg
  String get success => 'assets/images/success.svg';

  /// File path: assets/images/surreal_style.png
  AssetGenImage get surrealStyle =>
      const AssetGenImage('assets/images/surreal_style.png');

  /// File path: assets/images/welcome.png
  AssetGenImage get welcome => const AssetGenImage('assets/images/welcome.png');

  /// List of all assets
  List<dynamic> get values => [
        background,
        background2,
        blur,
        blurHome,
        colorfulStyle,
        cyberpunkStyle,
        fantasyStyle,
        impressionistStyle,
        minimalistStyle,
        popStyle,
        profileBg3,
        realisticStyle,
        success,
        surrealStyle,
        welcome
      ];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

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
