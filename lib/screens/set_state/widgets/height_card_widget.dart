//HeightCard

import 'package:bmiapp/components/app_color.dart';
import 'package:bmiapp/components/app_text.dart';
import 'package:bmiapp/components/app_textstyle.dart';
import 'package:flutter/material.dart';

class HeightCard extends StatefulWidget {
  final int height;
  final ValueChanged<int> onHeightChanged;

  const HeightCard({
    super.key,
    required this.height,
    required this.onHeightChanged,
  });

  @override
  State<HeightCard> createState() => _HeightCardState();
}

class _HeightCardState extends State<HeightCard> {
  late int height;

  @override
  void initState() {
    super.initState();
    height = widget.height;
  }

  void _updateHeight(int newHeight) {
    setState(() => height = newHeight);
    widget.onHeightChanged(newHeight);
  }

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
          const SizedBox(height: 18),
          AppText(
            text: 'Height (CM)',
            style: AppTextstyle.tsRegularMidnightBlue17,
          ),
          const SizedBox(height: 3),
          AppText(
            text: height.toString(),
            style: AppTextstyle.tsBoldVioletBlue57.copyWith(height: 1.0),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 10,
            child: Slider(
              activeColor: AppColor.blueViolet,
              min: 50,
              max: 300,
              value: height.toDouble(),
              onChanged: (newHeight) => _updateHeight(newHeight.round()),
            ),
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              const SizedBox(width: 28),
              AppText(
                text: '50 cm',
                style: AppTextstyle.tsRegularobsidianBlue12,
              ),
              const Spacer(),
              AppText(
                text: '300 cm',
                style: AppTextstyle.tsRegularobsidianBlue12,
              ),
              const SizedBox(width: 28),
            ],
          ),
        ],
      ),
    );
  }
}
