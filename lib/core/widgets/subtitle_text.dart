import 'package:flutter/material.dart';
import 'package:modern_tech/core/consts/string_consts.dart';
import 'package:modern_tech/core/theming/color_manager.dart';

class SubtitleText extends StatelessWidget {
  const SubtitleText(
      {required this.text,
      this.align,
      this.color,
      this.decoration,
      this.fontSize,
      this.textOverflow,
      this.fontFamily,
      super.key});

  final String text;
  final Color? color;
  final String? fontFamily;
  final double? fontSize;
  final TextAlign? align;
  final TextDecoration? decoration;
  final TextOverflow? textOverflow;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
            color: color ?? subtitleColor,
            fontWeight: FontWeight.w400,
            fontSize: fontSize ?? 12,
            fontFamily: fontFamily ?? cairoFont,
            decoration: decoration ?? TextDecoration.none,
            decorationColor: color),
        textAlign: align ?? TextAlign.center,
        overflow: textOverflow);
  }
}
