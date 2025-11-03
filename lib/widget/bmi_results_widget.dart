import 'package:bmiapp/components/app_color.dart';
import 'package:bmiapp/components/app_text.dart';
import 'package:bmiapp/components/app_textstyle.dart';
import 'package:flutter/material.dart';

class BmiResults extends StatefulWidget {
  const BmiResults({super.key});

  @override
  State<BmiResults> createState() => _BmiResultsState();
}

class _BmiResultsState extends State<BmiResults> {
  
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, int>;
    final height = args['height']!;
    final weight = args['weight']!;
    final bmi = weight / ((height / 100) * (height / 100));
    String status;
    if (bmi < 18.5) {
      status = 'Underweight';
    } else if (bmi < 24.9) {
      status = 'Normal';
    } else if (bmi < 29.9) {
      status = 'Overweight';
    } else {
      status = 'Obese';
    }
    return Container(
              width: screenWidth - 60,
              height: (413 / 852) * screenHeight,
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  SizedBox(height: 56),
                  AppText(
                    text: 'BMI Results',
                    style: AppTextstyle.tsRegularMidnightBlue32,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      SizedBox(width: 50),
                      AppText(
                        text: bmi.toStringAsFixed(0),
                        style: AppTextstyle.tsBoldVioletBlue140.copyWith(
                          height: 1,
                        ),
                      ),
                      AppText(
                        text:
                            '.${bmi.toStringAsFixed(5).split('.')[1].substring(0, 2)}',
                        style: AppTextstyle.tsMediumVioletBlue42.copyWith(
                          height: 1,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.46),
                  AppText(
                    text: status,
                    style: AppTextstyle.tsMediumMidnightBlue24,
                  ),
                  SizedBox(height: 18.54),
                  AppText(
                    text:
                        'Underweight: BMI less than 18.5\nNormal weight: BMI 18.5 to 24.9\nOverweight: BMI 25 to 29.9\nObesity: 30 to 40',
                    style: AppTextstyle.tsMediumMidnightBlue13,
                  ),
                ],
              ),
            );
  }
}
