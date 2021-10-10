import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MonthCell extends StatelessWidget {
  final Color backgroundColor;
  final String text;
  final Color borderColor;

  const MonthCell({
    required this.backgroundColor,
    required this.text,
    required this.borderColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: borderColor, width: 0.5)),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
