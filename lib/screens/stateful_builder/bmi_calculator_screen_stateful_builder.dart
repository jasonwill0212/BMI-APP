import 'package:bmiapp/components/app_assets_path.dart';
import 'package:bmiapp/components/app_button.dart';
import 'package:bmiapp/components/app_color.dart';
import 'package:bmiapp/components/app_text.dart';
import 'package:bmiapp/components/app_textstyle.dart';
import 'package:bmiapp/routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BmiCalculatorScreenStatefulBuilder extends StatelessWidget {
  const BmiCalculatorScreenStatefulBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    int weight = 78;
    int height = 175;
    return Scaffold(
      backgroundColor: AppColor.lavenderMist,
      body: Column(
        children: [
          SizedBox(height: 54),
          AppText(
            text: 'BMI CALCULATOR',
            style: AppTextstyle.tsRegularMidnightBlue17,
          ),
          SizedBox(height: 39),
          AgeAndWeightCard(weight: weight),
          SizedBox(height: 23),
          HeightCard(height: height),
          SizedBox(height: 23),
          MaleAndFemaleCard(),
          SizedBox(height: 31),
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

//age and weight card
class AgeAndWeightCard extends StatelessWidget {
  final int weight;
  const AgeAndWeightCard({super.key, required this.weight});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;
    int age = 30;
    int weight = 78;
    return Row(
      children: [
        SizedBox(width: 30),
        Container(
          width: screenWidth - 237,
          height: (175 / 853) * screenHeight,
          decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              SizedBox(height: 27),
              AppText(text: 'Age', style: AppTextstyle.tsRegularDarkindigo17),
              SizedBox(height: 3),
              StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  return Column(
                    children: [
                      SizedBox(height: 3),
                      AppText(
                        text: age.toString(),
                        style: AppTextstyle.tsBoldVioletBlue57.copyWith(
                          height: 1.0,
                        ),
                      ),
                      SizedBox(height: 7),
                      Row(
                        children: [
                          SizedBox(width: 28),
                          InkWell(
                            onTap: () {
                              setState(() {
                                age--;
                              });
                            },
                            child: SvgPicture.asset(AppAssetsPath.icMinus),
                          ),
                          SizedBox(width: 31.66),
                          InkWell(
                            onTap: () {
                              setState(() {
                                age++;
                              });
                            },
                            child: SvgPicture.asset(AppAssetsPath.icPlus),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
        SizedBox(width: 21),
        Container(
          width: screenWidth - 237,
          height: (175 / 853) * screenHeight,
          decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              SizedBox(height: 27),
              AppText(
                text: 'Weight (KG)',
                style: AppTextstyle.tsRegularDarkindigo17,
              ),
              SizedBox(height: 3),
              StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  return Column(
                    children: [
                      SizedBox(height: 3),
                      AppText(
                        text: weight.toString(),
                        style: AppTextstyle.tsBoldVioletBlue57.copyWith(
                          height: 1.0,
                        ),
                      ),
                      SizedBox(height: 7),
                      Row(
                        children: [
                          SizedBox(width: 28),
                          InkWell(
                            onTap: () {
                              setState(() {
                                weight--;
                              });
                            },
                            child: SvgPicture.asset(AppAssetsPath.icMinus),
                          ),
                          SizedBox(width: 31.66),
                          InkWell(
                            onTap: () {
                              setState(() {
                                weight++;
                              });
                            },
                            child: SvgPicture.asset(AppAssetsPath.icPlus),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

//Height Card

class HeightCard extends StatelessWidget {
  final int height;
  const HeightCard({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;
    int height = 175;
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
            style: AppTextstyle.tsRegularMidnightBlue17,
          ),
          SizedBox(height: 3),

          StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Column(
                children: [
                  AppText(
                    text: height.toString(),
                    style: AppTextstyle.tsBoldVioletBlue57.copyWith(
                      height: 1.0,
                    ),
                  ),
                  SizedBox(height: 12),
                  SizedBox(
                    height: 10,
                    child: Slider(
                      activeColor: AppColor.blueViolet,
                      min: 50,
                      max: 300,
                      value: height.toDouble(),
                      onChanged: (newheight) {
                        setState(() {
                          height = newheight.round();
                        });
                      },
                    ),
                  ),
                ],
              );
            },
          ),
          SizedBox(height: 18),
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

//Male And Female Card

class MaleAndFemaleCard extends StatelessWidget {
  const MaleAndFemaleCard({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;
    bool isFemale = true;
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText(text: 'Male', style: AppTextstyle.tsRegularDarkindigo17),
              SizedBox(width: 45),
              StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  return Switch(
                    activeThumbColor: AppColor.blueViolet,
                    activeTrackColor: AppColor.lavenderMist,
                    inactiveThumbColor: AppColor.blueViolet,
                    inactiveTrackColor: AppColor.lavenderMist,
                    value: isFemale,
                    onChanged: (newisFemale) {
                      setState(() {
                        isFemale = newisFemale;
                      });
                    },
                  );
                },
              ),
              SizedBox(width: 45),
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
