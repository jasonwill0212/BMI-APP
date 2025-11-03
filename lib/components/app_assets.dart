import 'package:flutter/material.dart';

class AppAssets extends StatelessWidget {
  final String path;
  final double? width;
  final double? height;

  const AppAssets({
    super.key,
    required this.path,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;
    return Image.asset(
      path,
      width: width ??  screenWidth - 97 ,     
      height: height ?? (251 / 852) * screenHeight,   
    );
  }
}
