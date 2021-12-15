import 'package:flutterbmi/constants/app_constant.dart';
import '../widgets/left_bar.dart';
import '../widgets/right_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //? Variables for Input
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
            // SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //? Height Font (LeftSide)
                Container(
                  width: 130,
                  child: TextField(
                    //? Controller for Height Input
                    controller: _heightController,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: accentHexColor,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Height",
                      hintStyle: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: Colors.white.withOpacity(.8),
                      ),
                    ),
                  ),
                ),
                //? Weight Font (RightSide)
                Container(
                  width: 130,
                  child: TextField(
                    //?Controller for Weight Input
                    controller: _weightController,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: accentHexColor,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Weight",
                      hintStyle: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: Colors.white.withOpacity(.8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 50),
            Container(
              child: Text(
                _bmiResult.toStringAsFixed(2),
                style: TextStyle(
                  fontSize: 90,
                  color: accentHexColor,
                ),
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
                    color: accentHexColor,
                  ),
                ),
              ),
            ),
            SizedBox(height: 50),
            //? Calculate Button
            GestureDetector(
              onTap: () {
                //? Variable to Convert Input and Output
                double _h = double.parse(_heightController.text);
                double _w = double.parse(_weightController.text);

                setState(() {
                  _bmiResult = _w / (_h * _h);
                  if (_bmiResult > 25) {
                    _textResult = "Ah Ko Gemuk!";
                  } else if (_bmiResult >= 18.5 && _bmiResult <= 25) {
                    _textResult = "Normal? Ini semua batak!";
                  } else if (_bmiResult < 18.5) {
                    _textResult = "Ko Lidi diam";
                  } else {
                    _textResult = "Please Enter Correct Input";
                  }
                });
              },
              child: Container(
                child: Text(
                  "Kira Skang!",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: accentHexColor),
                ),
              ),
            ),

            //? Bar Decoration on the RightSide
            SizedBox(height: 10), LeftBar(barWidth: 40),
            SizedBox(height: 20), LeftBar(barWidth: 70),
            // SizedBox(height: 20), LeftBar(barWidth: 40),

            //? Bar Decoration on LeftSide
            SizedBox(height: 10), RightBar(barWidth: 70),
            SizedBox(height: 20), RightBar(barWidth: 40),
            // SizedBox(height: 20), RightBar(barWidth: 40),
          ],
        ),
      ),
    );
  }
}
