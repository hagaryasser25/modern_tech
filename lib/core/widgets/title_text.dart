import 'package:flutter/material.dart';
import 'package:modern_tech/core/consts/string_consts.dart';
import 'package:modern_tech/core/theming/color_manager.dart';

class TitleText extends StatelessWidget {
  const TitleText(
      {required this.text,
      this.align,
      this.decoration,
      this.color,
      this.fontSize,
      this.fontFamily,
      super.key});

  final String text;
  final Color? color;
  final String? fontFamily;
  final double? fontSize;
  final TextAlign? align;
  final TextDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color ?? titleColor,
        fontWeight: FontWeight.w600,
        fontSize: fontSize ?? 22,
        fontFamily: fontFamily ?? cairoFont,
        decoration: decoration ?? TextDecoration.none,
      ),
      textAlign: align ?? TextAlign.center,
    );
  }
}
