import 'package:bmiapp/components/app_button.dart';
import 'package:bmiapp/components/app_color.dart';
import 'package:bmiapp/components/app_text.dart';
import 'package:bmiapp/components/app_textstyle.dart';
import 'package:bmiapp/routes/app_route.dart';
import 'package:bmiapp/widget/age_and_weight_card_widget.dart';
import 'package:bmiapp/widget/female_and_male_card_widget.dart';
import 'package:bmiapp/widget/height_slider_widget.dart';
import 'package:flutter/material.dart';

ValueNotifier<int> age = ValueNotifier<int>(25);
ValueNotifier<int> weight = ValueNotifier<int>(78);
ValueNotifier<int> height = ValueNotifier<int>(175);
ValueNotifier<bool> isFeMale = ValueNotifier<bool>(true);

class BmiCalculatorScreen extends StatefulWidget {
  const BmiCalculatorScreen({super.key});

  @override
  State<BmiCalculatorScreen> createState() => _BmiCalculatorScreenState();
}

class _BmiCalculatorScreenState extends State<BmiCalculatorScreen> {
  @override
  Widget build(BuildContext context) {
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
          AgeAndWeightCardWidget(age: age.value, weight: weight.value),
          SizedBox(height: 23),
          HeightSliderWidget(height: height.value),
          SizedBox(height: 23),
          FemaleAndMaleCardWidget(),
          SizedBox(height: 31),
          AppButton(
            buttonText: 'Calculate BMI',
            onTap: () async {
              await Navigator.pushNamed(
                context,
                AppRoute.bmiResultsScreen,
                arguments: {
                  'weight': weight.value,
                  'height': height.value,
                },
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

