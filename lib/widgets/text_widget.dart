import 'package:flutter/material.dart';
import 'package:alerta_push_app/utils/app_colors.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final String? fontFamily;
  const TextWidget(
      {super.key,
      required this.text,
      this.fontSize = 22,
      this.color = AppColors.white,
      this.fontFamily = "PB"});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        fontFamily: fontFamily,
      ),
    );
  }
}
