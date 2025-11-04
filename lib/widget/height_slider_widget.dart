import 'package:bmiapp/components/app_color.dart';
import 'package:bmiapp/components/app_text.dart';
import 'package:bmiapp/components/app_textstyle.dart';
import 'package:bmiapp/screens/bmi_calculator_screen.dart';
import 'package:flutter/material.dart';

class HeightSliderWidget extends StatelessWidget {
  const HeightSliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;
    return Container(
      width: screenWidth - 60,
      height: (183 / 852) * screenHeight,
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          SizedBox(height: 18),
          AppText(
            text: 'Height (CM)',
            style: AppTextstyle.tsRegularMidnightBlue17.copyWith(height: 1.0),
          ),
          SizedBox(height: 3),
          ValueListenableBuilder(
            valueListenable: height,
            builder: (context, value, child) {
              return Column(
                children: [
                  AppText(
                    text: height.value.toString(),
                    style: AppTextstyle.tsBoldVioletBlue57.copyWith(
                      height: 1.0,
                    ),
                  ),
                  SizedBox(height: 12),
                  SizedBox(
                    height: 10,
                    child: Slider(
                      value: value.toDouble(),
                      min: 50,
                      max: 300,
                      activeColor: AppColor.blueViolet,
                      inactiveColor: AppColor.gray,
                      onChanged: (newHeight) {
                        height.value = newHeight.round();
                      },
                    ),
                  ),
                ],
              );
            },
          ),
          SizedBox(height: 19),
          Row(
            children: [
              SizedBox(width: 28),
              AppText(
                text: '50 cm',
                style: AppTextstyle.tsRegularobsidianBlue12,
              ),
              SizedBox(width: 193),
              AppText(
                text: '300 cm',
                style: AppTextstyle.tsRegularobsidianBlue12,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
