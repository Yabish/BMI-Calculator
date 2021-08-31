import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  CardContainer({
    @required this.color,
    this.child,
    this.onTapFunction,
    this.height,
  });

  final Color color;
  final Widget child;
  final Function onTapFunction;
  final double height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapFunction,
      child: Container(
        height: height,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        width: double.infinity,
        child: child,
      ),
    );
  }
}
