//Male And Female
import 'package:bmiapp/components/app_color.dart';
import 'package:bmiapp/components/app_text.dart';
import 'package:bmiapp/components/app_textstyle.dart';
import 'package:flutter/material.dart';

class MaleAndFemaleCard extends StatefulWidget {
  const MaleAndFemaleCard({super.key});

  @override
  State<MaleAndFemaleCard> createState() => _MaleAndFemaleCardState();
}

class _MaleAndFemaleCardState extends State<MaleAndFemaleCard> {
  bool isFemale = true;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return Container(
      width: screenWidth - 60,
      height: (135 / 852) * screenHeight,
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          const SizedBox(height: 25),
          AppText(text: 'Gender', style: AppTextstyle.tsRegularMidnightBlue17),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText(text: 'Male', style: AppTextstyle.tsRegularDarkindigo17),
              const SizedBox(width: 45),
              Switch(
                activeThumbColor: AppColor.blueViolet,
                activeTrackColor: AppColor.lavenderMist,
                inactiveThumbColor: AppColor.blueViolet,
                inactiveTrackColor: AppColor.lavenderMist,
                value: isFemale,
                onChanged: (newValue) {
                  setState(() {
                    isFemale = newValue;
                  });
                },
              ),
              const SizedBox(width: 45),
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
