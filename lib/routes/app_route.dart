import 'package:bmiapp/screens/bmi_result_screen.dart';
import 'package:bmiapp/screens/bmi_calculator_screen.dart';
import 'package:bmiapp/screens/set_state/bmi_calculator_screen_set_state.dart';
import 'package:bmiapp/screens/splash_screen.dart';
import 'package:bmiapp/screens/stateful_builder/bmi_calculator_screen_stateful_builder.dart';
import 'package:flutter/material.dart';

class AppRoute {
  /// Routes name constants
  static const String splashScreen = '/splashScreen';
  static const String bmiCalculatorScreen = '/bmiCalculatorScreen';
  static const String bmiResultsScreen = '/bmiResultsScreen';
  static const String bmiCalculatorScreenStatefullBuilder =
      '/bmiCalculatorScreenStatefullBuilder';
  static const String bmiCalculatorScreenSetState =
      '/BmiCalculatorScreenSetState';

  /// Routes mapping
  Map<String, Widget Function(BuildContext)> routes = <String, WidgetBuilder>{
    AppRoute.splashScreen: (context) => const SplashScreen(),
    AppRoute.bmiCalculatorScreen: (context) => const BmiCalculatorScreen(),
    AppRoute.bmiResultsScreen: (context) => const BmiResultScreen(),
    AppRoute.bmiCalculatorScreenStatefullBuilder: (context) =>
        const BmiCalculatorScreenStatefulBuilder(),
    AppRoute.bmiCalculatorScreenSetState: (context) =>
        const BmiCalculatorScreenSetState(),
  };
}
