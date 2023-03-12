/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsFontsGen {
  const $AssetsFontsGen();

  String get mulishBold => 'assets/fonts/Mulish-Bold.ttf';
  String get mulishExtraBold => 'assets/fonts/Mulish-ExtraBold.ttf';
  String get mulishRegular => 'assets/fonts/Mulish-Regular.ttf';
  String get mulishSemiBold => 'assets/fonts/Mulish-SemiBold.ttf';
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  AssetGenImage get imageLogin => const AssetGenImage('assets/images/image_login.png');
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  $AssetsSvgAppGen get app => const $AssetsSvgAppGen();
  $AssetsSvgCommonGen get common => const $AssetsSvgCommonGen();
  $AssetsSvgLoginGen get login => const $AssetsSvgLoginGen();
}

class $AssetsSvgAppGen {
  const $AssetsSvgAppGen();

  SvgGenImage get logoApp => const SvgGenImage('assets/svg/app/logo_app.svg');
}

class $AssetsSvgCommonGen {
  const $AssetsSvgCommonGen();

  SvgGenImage get iconUs => const SvgGenImage('assets/svg/common/icon_us.svg');
  SvgGenImage get iconVn => const SvgGenImage('assets/svg/common/icon_vn.svg');
}

class $AssetsSvgLoginGen {
  const $AssetsSvgLoginGen();

  SvgGenImage get iconFacebook => const SvgGenImage('assets/svg/login/icon_facebook.svg');
  SvgGenImage get iconGoogle => const SvgGenImage('assets/svg/login/icon_google.svg');
  SvgGenImage get iconPhone => const SvgGenImage('assets/svg/login/icon_phone.svg');
}

class Assets {
  Assets._();

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
}

class AssetGenImage extends AssetImage {
  const AssetGenImage(String assetName) : super(assetName);

  Image image({
    Key? key,
    ImageFrameBuilder? frameBuilder,
    ImageLoadingBuilder? loadingBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? width,
    double? height,
    Color? color,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    FilterQuality filterQuality = FilterQuality.low,
  }) {
    return Image(
      key: key,
      image: this,
      frameBuilder: frameBuilder,
      loadingBuilder: loadingBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      width: width,
      height: height,
      color: color,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      filterQuality: filterQuality,
    );
  }

  String get path => assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    Color? color,
    BlendMode colorBlendMode = BlendMode.srcIn,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    Clip clipBehavior = Clip.hardEdge,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      color: color,
      colorBlendMode: colorBlendMode,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      clipBehavior: clipBehavior,
    );
  }

  String get path => _assetName;
}
