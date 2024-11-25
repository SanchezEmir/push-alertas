import 'package:flutter/material.dart';
import 'package:alerta_push_app/utils/app_colors.dart';

class MaterialButtomWidget extends StatelessWidget {
  final String text;
  final EdgeInsets margin;
  final VoidCallback onPressed;
  final Color colorText;
  final double fontSize;
  final Color colorButtom;
  final double height;
  const MaterialButtomWidget({
    super.key,
    required this.text,
    this.margin = const EdgeInsets.symmetric(horizontal: 20),
    required this.onPressed,
    this.colorText = AppColors.white,
    this.fontSize = 15,
    this.colorButtom = AppColors.blue,
    this.height = 40,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: double.infinity,
      child: MaterialButton(
        height: height,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: colorButtom,
        onPressed: onPressed,
        child: Text(
          text,
          style:
              TextStyle(color: colorText, fontSize: fontSize, fontFamily: "PB"),
        ),
      ),
    );
  }
}
