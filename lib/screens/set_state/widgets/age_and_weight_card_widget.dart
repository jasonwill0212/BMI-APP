import 'package:bmiapp/components/app_assets_path.dart';
import 'package:bmiapp/components/app_color.dart';
import 'package:bmiapp/components/app_text.dart';
import 'package:bmiapp/components/app_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AgeAndWeightCard extends StatefulWidget {
  final int weight;
  final ValueChanged<int> onWeightChanged;

  const AgeAndWeightCard({
    super.key,
    required this.weight,
    required this.onWeightChanged,
  });

  @override
  State<AgeAndWeightCard> createState() => _AgeAndWeightCardState();
}

class _AgeAndWeightCardState extends State<AgeAndWeightCard> {
  int age = 30;
  int weight = 78;

  @override
  void initState() {
    super.initState();
    weight = widget.weight;
  }

  void _updateWeight(int newWeight) {
    setState(() => weight = newWeight);
    widget.onWeightChanged(newWeight);
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return Row(
      children: [
        const SizedBox(width: 30),
        Container(
          width: screenWidth - 237,
          height: (175 / 853) * screenHeight,
          decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              const SizedBox(height: 27),
              AppText(text: 'Age', style: AppTextstyle.tsRegularDarkindigo17),
              const SizedBox(height: 3),
              AppText(
                text: age.toString(),
                style: AppTextstyle.tsBoldVioletBlue57.copyWith(height: 1.0),
              ),
              const SizedBox(height: 7),
              Row(
                children: [
                  const SizedBox(width: 28),
                  InkWell(
                    onTap: () {
                      setState(() {
                        if (age > 0) age--;
                      });
                    },
                    child: SvgPicture.asset(AppAssetsPath.icMinus),
                  ),
                  const SizedBox(width: 31.66),
                  InkWell(
                    onTap: () {
                      setState(() => age++);
                    },
                    child: SvgPicture.asset(AppAssetsPath.icPlus),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(width: 21),
        Container(
          width: screenWidth - 237,
          height: (175 / 853) * screenHeight,
          decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              const SizedBox(height: 27),
              AppText(
                text: 'Weight (KG)',
                style: AppTextstyle.tsRegularDarkindigo17,
              ),
              const SizedBox(height: 3),
              AppText(
                text: weight.toString(),
                style: AppTextstyle.tsBoldVioletBlue57.copyWith(height: 1.0),
              ),
              const SizedBox(height: 7),
              Row(
                children: [
                  const SizedBox(width: 28),
                  InkWell(
                    onTap: () {
                      if (weight > 1) _updateWeight(weight - 1);
                    },
                    child: SvgPicture.asset(AppAssetsPath.icMinus),
                  ),
                  const SizedBox(width: 31.66),
                  InkWell(
                    onTap: () {
                      _updateWeight(weight + 1);
                    },
                    child: SvgPicture.asset(AppAssetsPath.icPlus),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
