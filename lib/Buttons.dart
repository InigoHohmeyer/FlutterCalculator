import 'package:flutter/material.dart';
class Button extends StatelessWidget {

  final color;
  final textColor;
  final String buttonText;
  final ButtonTapped;

  const Button({Key key, this.color, this.textColor, this.buttonText, this.ButtonTapped}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: ButtonTapped,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Container(
          color: color,
          child: Center(child: Text(buttonText, style: TextStyle(color: textColor),),),
        ),
      ),
    );
  }
}
