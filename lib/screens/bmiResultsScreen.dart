import 'package:bmiapp/components/app_button.dart';
import 'package:bmiapp/components/app_color.dart';
import 'package:bmiapp/components/app_text.dart';
import 'package:bmiapp/components/app_textstyle.dart';
import 'package:bmiapp/routes/app_route.dart';
import 'package:bmiapp/widget/bmi_results_widget.dart';
import 'package:flutter/material.dart';

class BmiResultScreen extends StatefulWidget {
  const BmiResultScreen({super.key});
  @override
  State<BmiResultScreen> createState() => _BmiResultScreenState();
}
class _BmiResultScreenState extends State<BmiResultScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lavenderMist,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 54),
            AppText(
              text: 'BMI CALCULATOR',
              style: AppTextstyle.tsRegularMidnightBlue17,
            ),
            SizedBox(height: 67),
            AppText(
              text: 'Body Mass Index',
              style: AppTextstyle.tsRegularMidnightBlue27,
            ),
            SizedBox(height: 42),
            BmiResults(),
            SizedBox(height: 50,),
            AppButton(
              buttonText: 'Save the results',
              onTap: (){
                Navigator.pushReplacementNamed(context, AppRoute.splashScreen);
              },
              colorbutton: AppColor.blueViolet,
              tStyle: AppTextstyle.tsMediumWhite17,
            ),
          ],
        ),
      ),
    );
  }
}












