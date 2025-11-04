import 'package:bmiapp/components/app_button.dart';
import 'package:bmiapp/components/app_color.dart';
import 'package:bmiapp/components/app_text.dart';
import 'package:bmiapp/components/app_textstyle.dart';
import 'package:bmiapp/routes/app_route.dart';
import 'package:bmiapp/screens/set_state/widgets/age_and_weight_card_widget.dart';
import 'package:bmiapp/screens/set_state/widgets/height_card_widget.dart';
import 'package:bmiapp/screens/set_state/widgets/male_and_female_card_widget.dart';
import 'package:flutter/material.dart';

class BmiCalculatorScreenSetState extends StatelessWidget {
  const BmiCalculatorScreenSetState({super.key});

  @override
  Widget build(BuildContext context) {
    int weight = 78;
    int height = 175;
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
          AgeAndWeightCard(
            weight: weight,
            onWeightChanged: (newWeight) {
              weight = newWeight;
            },
          ),
          const SizedBox(height: 23),
          HeightCard(
            height: height,
            onHeightChanged: (newHeight) {
              height = newHeight;
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
