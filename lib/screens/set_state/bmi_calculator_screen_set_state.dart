import 'package:bmiapp/components/app_assets_path.dart';
import 'package:bmiapp/components/app_button.dart';
import 'package:bmiapp/components/app_color.dart';
import 'package:bmiapp/components/app_text.dart';
import 'package:bmiapp/components/app_textstyle.dart';
import 'package:bmiapp/routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BmiCalculatorScreenSetState extends StatefulWidget {
  const BmiCalculatorScreenSetState({super.key});

  @override
  State<BmiCalculatorScreenSetState> createState() =>
      _BmiCalculatorScreenSetStateState();
}

class _BmiCalculatorScreenSetStateState
    extends State<BmiCalculatorScreenSetState> {
  int weight = 78;
  int height = 175;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lavenderMist,
      body: Column(
        children: [
          const SizedBox(height: 54),
          AppText(
            text: 'BMI CALCULATOR',
            style: AppTextstyle.tsRegularMidnightBlue17,
          ),
          const SizedBox(height: 39),
          AgeAndWeghtCard(
            weight: weight,
            onWeightChanged: (newWeight) {
              setState(() {
                weight = newWeight;
              });
            },
          ),
          const SizedBox(height: 23),
          HeightCard(
            height: height,
            onHeightChanged: (newHeight) {
              setState(() {
                height = newHeight;
              });
            },
          ),
          const SizedBox(height: 23),
          const MaleAndFemaleCard(),
          const SizedBox(height: 31),
          AppButton(
            buttonText: 'Calculate BMI',
            onTap: () {
              Navigator.pushNamed(
                context,
                AppRoute.bmiResultsScreen,
                arguments: {'height': height, 'weight': weight},
              );
            },
            colorbutton: AppColor.blueViolet,
            tStyle: AppTextstyle.tsMediumWhite17,
          ),
        ],
      ),
    );
  }
}

class AgeAndWeghtCard extends StatefulWidget {
  final int weight;
  final ValueChanged<int> onWeightChanged;

  const AgeAndWeghtCard({
    super.key,
    required this.weight,
    required this.onWeightChanged,
  });

  @override
  State<AgeAndWeghtCard> createState() => _AgeAndWeghtCardState();
}

class _AgeAndWeghtCardState extends State<AgeAndWeghtCard> {
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
