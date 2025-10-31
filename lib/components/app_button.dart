import 'package:bmiapp/components/app_text.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final Color colorbutton;
  final String buttonText;
  final VoidCallback onTap;
  final double? width;
  final TextStyle tStyle;

  const AppButton({
    super.key,
    required this.buttonText,
    required this.onTap,
    this.width,
    required this.colorbutton,
    required this.tStyle
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? (size.width - 61),
        height: 75,

        decoration: BoxDecoration(
          color: colorbutton,
          borderRadius: BorderRadius.circular(62),
        ),
        alignment: Alignment.center,
        child: AppText(text: buttonText,style:tStyle),
      ),
    );
  }
}
