import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/icon_column.dart';
import 'package:bmi_calculator/screens/result_page.dart';
import 'package:bmi_calculator/service/calculator_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:bmi_calculator/components/card-container.dart';
import 'package:bmi_calculator/constants.dart';

enum GenderType {
  male,
  female,
}

void _showToast(context) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text(
        "Gender Required",
      ),
      action: SnackBarAction(
        label: 'OK',
        onPressed: scaffold.hideCurrentSnackBar,
      ),
      margin: EdgeInsets.only(
        bottom: 20,
        left: 20,
        right: 20,
      ),
    ),
  );
}

class InputPage extends StatefulWidget {
  const InputPage({Key key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderType selectedGender;
  int height = 170;
  int weight = 60;
  int age = 25;

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
            child: Row(
              children: [
                Expanded(
                  child: CardContainer(
                    onTapFunction: () {
                      setState(() {
                        selectedGender = GenderType.male;
                      });
                    },
                    color: selectedGender == GenderType.male
                        ? kActiveCardContainerColor
                        : kInActiveCardContainerColor,
                    child: IconColumn(
                      iconData: FontAwesomeIcons.male,
                      title: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: CardContainer(
                    onTapFunction: () {
                      setState(() {
                        selectedGender = GenderType.female;
                      });
                    },
                    color: selectedGender == GenderType.female
                        ? kActiveCardContainerColor
                        : kInActiveCardContainerColor,
                    child: IconColumn(
                      iconData: FontAwesomeIcons.female,
                      title: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: CardContainer(
              color: kActiveCardContainerColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'CM',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderThemeData(
                      thumbColor: Colors.red,
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Colors.grey,
                    ),
                    child: Slider(
                      min: 50,
                      max: 250,
                      value: height.toDouble(),
                      onChanged: (newValue) {
                        setState(() {
                          height = newValue.toInt();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CardContainer(
                    color: kActiveCardContainerColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              backgroundColor: Colors.grey,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              child: Icon(
                                Icons.remove,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            FloatingActionButton(
                              backgroundColor: Colors.grey,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              child: Icon(
                                Icons.add,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: CardContainer(
                    color: kActiveCardContainerColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              backgroundColor: Colors.grey,
                              onPressed: () {
                                setState(() {
                                  if (age > 1) age--;
                                });
                              },
                              child: Icon(
                                Icons.remove,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            FloatingActionButton(
                              backgroundColor: Colors.grey,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              child: Icon(
                                Icons.add,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            title: 'CALCULATE',
            onPress: () {
              CalculateBMI calc = CalculateBMI(
                height: height.toDouble(),
                weight: weight.toDouble(),
                gender: selectedGender,
                age: age,
              );

              print(calc.getGender());

              if (calc.getGender() != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      bmi: calc.calculate(),
                      bmiResult: calc.getResult(),
                      bmiResultMessage: calc.getResultMessage(),
                      gender: calc.getGender(),
                    ),
                  ),
                );
              } else {
                _showToast(context);
              }
            },
          )
        ],
      ),
    );
  }
}
