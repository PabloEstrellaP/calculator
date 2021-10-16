import 'package:calculator/widgets/customInput.dart';
import 'package:calculator/widgets/mathResult.dart';
import 'package:flutter/material.dart';

class CalculatorPage extends StatelessWidget {
  
  
  const CalculatorPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MathController()
              ],
            ),
          ),
        )
      ),
    );
  }
}