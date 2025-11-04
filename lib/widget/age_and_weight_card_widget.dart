import 'package:bmiapp/components/app_assets_path.dart';
import 'package:bmiapp/components/app_color.dart';
import 'package:bmiapp/components/app_text.dart';
import 'package:bmiapp/components/app_textstyle.dart';
import 'package:bmiapp/screens/bmi_calculator_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AgeAndWeightCardWidget extends StatelessWidget {
  const AgeAndWeightCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 30),
        _buildAgeWeightItemWidget(
          context: context,
          valueNotifier: age,
          title: 'Age',
        ),
        SizedBox(width: 21),
        _buildAgeWeightItemWidget(
          context: context,
          valueNotifier: weight,
          title: 'Weight',
        ),
        SizedBox(width: 30),
      ],
    );
  }

  Container _buildAgeWeightItemWidget({
    required BuildContext context,
    required ValueNotifier<int> valueNotifier,
    required String title,
  }) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;
    return Container(
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(12),
      ),
      width: (screenWidth - 81) / 2,
      height: (175 / 853) * screenHeight,
      child: Column(
        children: [
          SizedBox(height: 27),
          AppText(
            text: title,
            style: AppTextstyle.tsRegularDarkindigo17.copyWith(height: 1.0),
          ),
          SizedBox(height: 3),
          ValueListenableBuilder(
            valueListenable: valueNotifier,
            builder: (context, value, child) {
              return Column(
                children: [
                  Text(
                    valueNotifier.value.toString(),
                    style: AppTextstyle.tsBoldVioletBlue57.copyWith(
                      height: 1.0,
                    ),
                  ),
                  SizedBox(height: 7),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          if (valueNotifier.value > 1) {
                            valueNotifier.value--;
                          }
                        },
                        child: SvgPicture.asset(
                          AppAssetsPath.icMinus,
                          width: 34,
                          height: 34,
                        ),
                      ),
                      SizedBox(width: 31.66),
                      InkWell(
                        onTap: () {
                          valueNotifier.value++;
                        },
                        child: SvgPicture.asset(
                          AppAssetsPath.icPlus,
                          width: 34,
                          height: 34,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
