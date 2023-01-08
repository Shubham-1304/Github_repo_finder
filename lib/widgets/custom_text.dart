import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final List<Shadow>? shadow;
  final String? text;
  final double? fontSize;
  final FontWeight? fontWeight;
  CustomText({
    @required this.text,
    @required this.shadow,
    @required this.fontSize,
    @required this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    
    return Container(
      child: Text(
        text!,
        style: TextStyle(
          color: Colors.white,
          fontWeight: fontWeight,
          shadows: shadow,
          fontSize: fontSize,
        ),
      ),
    );
  }
}