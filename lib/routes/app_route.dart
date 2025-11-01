import 'package:bmiapp/screens/bmi_calculator_screen.dart';
import 'package:bmiapp/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoute {
  /// Routes name constants
  static const String splashScreen = '/splashScreen';
  static const String bmiCalculatorScreen = '/bmiCalculatorScreen';
  static const String thirdScreen = '/thirdScreen';
  static const String fourScreen = '/fourScreen';

  /// Routes mapping
  Map<String, Widget Function(BuildContext)> routes = <String, WidgetBuilder>{
    AppRoute.splashScreen: (context) => const SplashScreen(),
    AppRoute.bmiCalculatorScreen: (context) => const BmiCalculatorScreen(),
    AppRoute.thirdScreen: (context) => const ThirdScreen(),
    AppRoute.fourScreen: (context) => const FourScreen(),
  };
}
