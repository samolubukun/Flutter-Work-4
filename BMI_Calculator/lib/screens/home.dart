import 'package:bmi_calculator/constants/app_constants.dart';
import 'package:bmi_calculator/widgets/left_bar.dart';
import 'package:bmi_calculator/widgets/right_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0;
  String _textResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI Calculator",
          style: TextStyle(color: accentHexColor, fontWeight: FontWeight.w300),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: mainHexColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Container(
                    width: 130,
                    child: Column(
                      children: [
                        Text(
                          'Height (cm):',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                              color: Colors.white.withOpacity(.8)),
                        ),
                        TextField(
                          controller: _heightController,
                          style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w300,
                              color: accentHexColor),
                          keyboardType: TextInputType.number,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: 130,
                    child: Column(
                      children: [
                        Text(
                          'Weight (kg):',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                              color: Colors.white.withOpacity(.8)),
                        ),
                        TextField(
                          controller: _weightController,
                          style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w300,
                              color: accentHexColor),
                          keyboardType: TextInputType.number,
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    double _h = double.parse(_heightController.text) /
                        100; // Convert cm to m
                    double _w = double.parse(_weightController.text);
                    setState(() {
                      _bmiResult = _w / (_h * _h);
                      if (_bmiResult > 25) {
                        _textResult = "You're overweight";
                      } else if (_bmiResult >= 18.5) {
                        _textResult = "You have Normal weight";
                      } else {
                        _textResult = "You're underweight";
                      }
                    });
                  },
                  child: Container(
                    width: 130,
                    child: Text(
                      "Calculate",
                      style: TextStyle(fontSize: 20, color: accentHexColor),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 50),
            Container(
              child: Text(
                _bmiResult.toStringAsFixed(2),
                style: TextStyle(fontSize: 60, color: accentHexColor),
              ),
            ),
            SizedBox(height: 30),
            Visibility(
              visible: _textResult.isNotEmpty,
              child: Container(
                child: Text(
                  _textResult,
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w400,
                      color: accentHexColor),
                ),
              ),
            ),
            SizedBox(height: 10),
            LeftBar(barWidth: 40),
            SizedBox(height: 20),
            LeftBar(barWidth: 70),
            SizedBox(height: 20),
            LeftBar(barWidth: 40),
            SizedBox(height: 20),
            RightBar(barWidth: 70),
            SizedBox(height: 20),
            RightBar(barWidth: 70),
          ],
        ),
      ),
    );
  }
}
