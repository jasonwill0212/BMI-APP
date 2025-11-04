import 'package:bmiapp/components/app_color.dart';
import 'package:bmiapp/components/app_text.dart';
import 'package:bmiapp/components/app_textstyle.dart';
import 'package:flutter/material.dart';

class FemaleAndMaleCardWidget extends StatelessWidget {
  const FemaleAndMaleCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;
    ValueNotifier<bool> isFeMale = ValueNotifier<bool>(true);
    return Container(
      width: screenWidth - 60,
      height: (135 / 852) * screenHeight,
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          SizedBox(height: 25),
          AppText(text: 'Gender', style: AppTextstyle.tsRegularMidnightBlue17),
          SizedBox(height: 16),
          Row(
            children: [
              SizedBox(width: 45),
              AppText(text: 'Male', style: AppTextstyle.tsRegularDarkindigo17),
              SizedBox(width: 51),
              ValueListenableBuilder(
                valueListenable: isFeMale,
                builder: (context, value, child) {
                  return Switch(
                    activeThumbColor: AppColor.blueViolet,
                    inactiveThumbColor: AppColor.lavenderBlue,
                    activeTrackColor: AppColor.lavenderMist,
                    inactiveTrackColor: AppColor.lavenderMist,
                    value: value,
                    onChanged: (newvalue) {
                      isFeMale.value = newvalue;
                    },
                  );
                },
              ),
              SizedBox(width: 42),
              AppText(
                text: 'Female',
                style: AppTextstyle.tsRegularDarkindigo17,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
