import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modern_tech/core/consts/string_consts.dart';
import 'package:modern_tech/core/widgets/subtitle_text.dart';
import 'package:modern_tech/core/widgets/title_text.dart';

import '../consts/dimensions_constants.dart';
import '../theming/color_manager.dart';

class InputText extends StatefulWidget {
  const InputText({
    this.title,
    this.width,
    this.controller,
    this.maxLine,
    this.enable,
    this.subTitle,
    this.borderColor,
    this.hint,
    this.radius,
    this.fillColor,
    this.prefixIcon,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.suffixIcon,
    this.obscureText = false,
    this.isPassword = false,
    this.hasValidationSpace = true,
    this.inputColor,
    super.key,
  });

  final double? width;
  final String? title;
  final String? subTitle;
  final String? hint;
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final bool obscureText, isPassword, hasValidationSpace;
  final bool? enable;
  final ValueChanged<String>? onChanged;
  final Color? fillColor;
  final Color? borderColor;
  final double? radius;
  final int? maxLine;
  final Color? inputColor;

  @override
  State<InputText> createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  late final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? width.w,
      alignment: Alignment.center,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(curvyRadius)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title != null)
            Row(
              children: [
                Expanded(
                    child: SubtitleText(
                  text: widget.title ?? "",
                  fontSize: 12,
                  align: TextAlign.start,
                )),
                if (widget.subTitle != null)
                 TitleText(
                    text: widget.subTitle ?? "",
                    fontSize: 14,
                    fontFamily: interFont,
                  ),
              ],
            ),
          if (widget.title != null)
            SizedBox(
              height: edge * 0.5,
            ),
          TextField(
            focusNode: _focusNode,
            // Attach the FocusNode
            onTapOutside: (value) => FocusScope.of(context).unfocus(),

            keyboardType: widget.keyboardType,
            controller: widget.controller,
            style: TextStyle(color: widget.inputColor ?? titleColor),
            maxLines: widget.maxLine ?? 1,
            obscureText: widget.isPassword ? _securePass : widget.obscureText,
            enabled: widget.enable ?? true,
            onChanged: widget.onChanged ?? (v) {},

            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                    horizontal: 16, vertical: widget.maxLine != null ? 12 : 0),
                prefixIcon: widget.prefixIcon,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(curvyRadius),
                    borderSide: BorderSide(
                        color: widget.borderColor ?? borderColor, width: 1)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(curvyRadius),
                    borderSide: const BorderSide(color: borderColor, width: 1)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(curvyRadius),
                    borderSide: BorderSide(
                        color: widget.borderColor ?? borderColor, width: 1)),
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(curvyRadius),
                    borderSide: BorderSide(
                        color:
                            widget.borderColor ?? borderColor,
                        width: 1)),
                hintText: widget.hint,
                hintStyle: const TextStyle(
                    color: titleColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
                fillColor: (widget.enable ?? true)
                    ? Colors.transparent
                    : borderColor,
                filled: true,
                suffixIcon: widget.isPassword
                    ? GestureDetector(
                        onTap: _changeVisibility,
                        child: Icon(_securePass
                            ? Icons.visibility_off
                            : Icons.visibility),
                      )
                    : widget.suffixIcon ?? const SizedBox.shrink()),
          )
        ],
      ),
    );
  }

  bool _securePass = true;

  _changeVisibility() {
    _securePass = !_securePass;
    setState(() {});
  }
}
