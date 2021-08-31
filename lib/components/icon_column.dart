import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class IconColumn extends StatelessWidget {
  IconColumn({@required this.iconData, @required this.title});

  final IconData iconData;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconData,
          size: 60,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          title,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
