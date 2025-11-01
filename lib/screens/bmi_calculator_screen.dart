import 'package:bmiapp/routes/app_route.dart';
import 'package:flutter/material.dart';

ValueNotifier<int> age = ValueNotifier<int>(25);

class BmiCalculatorScreen extends StatefulWidget {
  const BmiCalculatorScreen({super.key});

  @override
  State<BmiCalculatorScreen> createState() => _BmiCalculatorScreenState();
}

class _BmiCalculatorScreenState extends State<BmiCalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("BmiCalculatorScreen"),
          ValueListenableBuilder(
            valueListenable: age,
            builder: (context, value, child) {
              return Column(
                children: [
                  Text(age.value.toString()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          age.value--;
                        },
                        child: Icon(Icons.remove),
                      ),
                      TextButton(
                        onPressed: () {
                          age.value++;
                        },
                        child: Icon(Icons.add),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoute.thirdScreen);
              // Navigator.pop(context, 'BMI Calculated Successfully');
            },
            child: Text("Calculate"),
          ),
        ],
      ),
    );
  }

  // StatefulBuilder(
  //   builder: (context, innerSetState) {
  //     return Column(
  //       children: [
  //         Text(age.toString()),
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             TextButton(
  //               onPressed: () {
  //                 innerSetState(() {
  //                   age--;
  //                 });
  //               },
  //               child: Icon(Icons.remove),
  //             ),
  //             TextButton(
  //               onPressed: () {
  //                 innerSetState(() {
  //                   age++;
  //                 });
  //               },
  //               child: Icon(Icons.add),
  //             ),
  //           ],
  //         ),
  //       ],
  //     );
  //   },
  // ),
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  int age = 25;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(age.toString()),
        Row(
          children: [
            TextButton(
              onPressed: () {
                setState(() {
                  age--;
                });
              },
              child: Icon(Icons.remove),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  age++;
                });
              },
              child: Icon(Icons.add),
            ),
          ],
        ),
      ],
    );
  }
}

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("ThirdScreen"),
          ValueListenableBuilder(
            valueListenable: age,
            builder: (context, value, child) {
              return Text("Age from BmiCalculatorScreen: ${age.value}");
            },
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, AppRoute.fourScreen);
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const FourScreen()),
              // );
            },
            child: Text("Calculate"),
          ),
        ],
      ),
    );
  }
}

class FourScreen extends StatelessWidget {
  const FourScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("FourScreen"),
          ValueListenableBuilder(
            valueListenable: age,
            builder: (context, value, child) {
              return Text("Age from BmiCalculatorScreen: ${age.value}");
            },
          ),
          TextButton(
            onPressed: () {
              Navigator.popUntil(
                context,
                ModalRoute.withName(AppRoute.splashScreen),
              );
            },
            child: Text("Calculate"),
          ),
        ],
      ),
    );
  }
}
