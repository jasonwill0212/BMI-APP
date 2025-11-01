import 'package:flutter/material.dart';

class AppAssets extends StatelessWidget {
  final String path;
  final double? width;
  final double? height;
  final BoxFit fit;

  const AppAssets({
    super.key,
    required this.path,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      width: width ??  296,     
      height: height ?? 251,   
      fit: fit,
    );
  }
}
