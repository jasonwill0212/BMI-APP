import 'package:bmiapp/components/app_assets_path.dart';
import 'package:bmiapp/components/app_color.dart';
import 'package:bmiapp/components/app_text.dart';
import 'package:bmiapp/components/app_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AgeAndWeightCardWidget extends StatelessWidget {
  final int weight;
  final int age;

  const AgeAndWeightCardWidget({
    super.key,
    required this.age,
    required this.weight,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;
    ValueNotifier<int> age = ValueNotifier<int>(25);
    ValueNotifier<int> weight = ValueNotifier<int>(78);
    return Row(
      children: [
        SizedBox(width: 30),
        Container(
          decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(12),
          ),
          width: screenWidth - 237,
          height: (175 / 853) * screenHeight,
          child: Column(
            children: [
              SizedBox(height: 27),
              AppText(
                text: 'Age',
                style: AppTextstyle.tsRegularDarkindigo17.copyWith(height: 1.0),
              ),
              SizedBox(height: 3),
              ValueListenableBuilder(
                valueListenable: age,
                builder: (context, value, child) {
                  return Column(
                    children: [
                      Text(
                        age.value.toString(),
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
                              age.value--;
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
                              age.value++;
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
        ),
        SizedBox(width: 21),
        Container(
          width: screenWidth - 237,
          height: (175 / 853) * screenHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColor.white,
          ),
          child: Column(
            children: [
              SizedBox(height: 27),
              AppText(
                text: 'Weight (KG)',
                style: AppTextstyle.tsRegularDarkindigo17.copyWith(height: 1.0),
              ),
              SizedBox(height: 3),
              ValueListenableBuilder(
                valueListenable: weight,
                builder: (context, value, child) {
                  return Column(
                    children: [
                      Text(
                        weight.value.toString(),
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
                              weight.value--;
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
                              weight.value++;
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
        ),
      ],
    );
  }
}
