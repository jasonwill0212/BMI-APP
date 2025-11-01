import 'package:flutter/material.dart';

class BmiCalculatorScreenSetState extends StatefulWidget {
  const BmiCalculatorScreenSetState({super.key});

  @override
  State<BmiCalculatorScreenSetState> createState() =>
      _BmiCalculatorScreenSetStateState();
}

class _BmiCalculatorScreenSetStateState
    extends State<BmiCalculatorScreenSetState>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
