import 'package:bmiapp/components/app_assets.dart';
import 'package:bmiapp/components/app_assets_path.dart';
import 'package:bmiapp/components/app_button.dart';
import 'package:bmiapp/components/app_color.dart';
import 'package:bmiapp/components/app_text.dart';
import 'package:bmiapp/components/app_textstyle.dart';
import 'package:bmiapp/routes/app_route.dart';
import 'package:bmiapp/screens/bmi_calculator_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.blueViolet,
      body: Column(
        children: [
          SizedBox(height: 81),
          Align(
            child: AppText(
              text: 'BMiDO',
              style: AppTextstyle.tsExtraBoldWhite30,
            ),
          ),
          SizedBox(height: 59),
          AppAssets(path: AppAssetsPath.imgPeopleAndBicycle),
          SizedBox(height: 95),

          Row(
            children: [
              SizedBox(width: 53),
              AppText(
                text: 'Get Started with\nTracking Your Health!',
                style: AppTextstyle.tsBoldWhite25,
                textAlign: TextAlign.left,
              ),
            ],
          ),
          SizedBox(height: 15),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 58),
              child: AppText(
                textAlign: TextAlign.left,
                text:
                    'Calculate your BMI and stay on top of \nyour wellness journey, effortlessly.',
                style: AppTextstyle.tsRegularlavenderBlue15,
              ),
            ),
          ),
          SizedBox(height: 38),
          AppButton(
            buttonText: 'Get Started',
            onTap: () async {
              final result = await Navigator.pushNamed(
                context,
                AppRoute.bmiCalculatorScreen,
                arguments: {'id': 1, 'name': 'BMI Result', 'isSplash': true},
              );

              print("Result from BmiCalculatorScreen: $result");
            },
            colorbutton: AppColor.lavenderMist,
            tStyle: AppTextstyle.tsMediumMidnightBlue17,
          ),
        ],
      ),
    );
  }
}
