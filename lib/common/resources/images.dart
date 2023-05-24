import 'package:flutter/material.dart';

const String _imagePath = 'assets/images';

class _Image extends AssetImage {
  const _Image(String fileName) : super('$_imagePath/$fileName');
}

class AppImages {
  static const splashLogo = _Image('logo_splash.jpg');

  static Future precacheAssets(BuildContext context) async {
    await precacheImage(splashLogo, context);
  }
}
