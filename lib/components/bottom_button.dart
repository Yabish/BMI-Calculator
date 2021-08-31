import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.title, this.onPress});

  final String title;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Container(
          color: Colors.red,
          height: 70,
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
