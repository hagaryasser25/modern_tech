import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modern_tech/core/consts/string_consts.dart';
import 'package:modern_tech/core/theming/color_manager.dart';
import 'package:modern_tech/core/widgets/loader.dart';
import 'package:modern_tech/core/widgets/title_text.dart';

import '../consts/dimensions_constants.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton(
      {required this.fun,
      required this.titleKey,
      this.w,
      this.fontWeight,
      this.icon,
      this.alignment,
      this.loaderColor,
      this.vertical,
      this.curvy,
      this.gradient = false,
      this.fontSize,
      this.loading = false,
      this.hi,
      this.btColor,
      this.borderColor,
      this.textColor,
      this.enable = true,
      super.key});

  final Alignment? alignment;
  final Function fun;
  final double? w;
  final double? hi;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? curvy;
  final String titleKey;
  final Color? btColor;
  final Color? borderColor;
  final Color? textColor;
  final bool loading;
  final Color? loaderColor;
  final bool enable;
  final bool? vertical;
  final bool gradient;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (enable && !loading) {
          fun();
        }
      },
      child: Container(
        height: hi ?? 45.h,
        width: w ?? width.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: enable ? btColor ?? backgroundColor : disableColor,
          borderRadius: BorderRadius.circular(curvy ?? curvyRadius),
          border: Border.all(
            color: const Color.fromARGB(255, 233, 231, 231),
            width: 1, 
          ),
        ),
        child: loading
            ? Loader(size: 45.0, color: loaderColor)
            : vertical ?? false
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      icon ?? const SizedBox.shrink(),
                      if (icon != null) const SizedBox(height: 5),
                      Row(
                        children: [
                          SvgPicture.asset("$imageUrl/google.svg"),
                          SizedBox(
                            width: edge,
                          ),
                          TitleText(
                            text: titleKey,
                            color: textColor ?? googleButton,
                            fontSize: fontSize ?? 15,
                          ),
                        ],
                      )
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      icon ?? const SizedBox.shrink(),
                      if (icon != null) const SizedBox(width: 2),
                      Row(
                        children: [
                          SvgPicture.asset("$imageUrl/google.svg"),
                          SizedBox(
                            width: edge,
                          ),
                          TitleText(
                            text: titleKey,
                            color: textColor ?? googleButton,
                            fontSize: fontSize ?? 15,
                          ),
                        ],
                      ),
                    ],
                  ),
      ),
    );
  }
}
