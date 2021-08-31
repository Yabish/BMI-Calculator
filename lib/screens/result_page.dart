import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/card-container.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({
    Key key,
    @required this.bmi,
    @required this.bmiResult,
    @required this.bmiResultMessage,
    @required this.gender,
  }) : super(key: key);

  final String bmi;
  final String bmiResult;
  final String bmiResultMessage;
  final String gender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xFF0A0E21),
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    'Your Result',
                    style: kTitleTextStyle,
                  ),
                ),
                CardContainer(
                  color: kActiveCardContainerColor,
                  height: 350,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        bmiResult.toUpperCase(),
                        style: kResultTextStyle,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        bmi,
                        style: kNumberTextStyle,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(gender),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Text(
                          bmiResultMessage,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            title: 'RE-CALCULATE',
            onPress: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
