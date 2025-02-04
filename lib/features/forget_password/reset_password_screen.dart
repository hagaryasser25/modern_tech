import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modern_tech/core/helpers/extensions.dart';
import 'package:modern_tech/core/theming/color_manager.dart';
import 'package:modern_tech/core/widgets/go_button.dart';
import 'package:modern_tech/core/widgets/input_text_general.dart';
import 'package:modern_tech/core/widgets/subtitle_text.dart';
import 'package:modern_tech/core/widgets/title_text.dart';

import '../../core/consts/dimensions_constants.dart';
import '../../core/consts/string_consts.dart';
import '../../core/routing/routes.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: backgroundColor,
        height: height.h,
        width: width.w,
        padding: EdgeInsets.all(edge * 2.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: edge,
            ),
            SvgPicture.asset("$imageUrl/arrow_black.svg"),
            SizedBox(
              height: edge * 0.8,
            ),
            TitleText(
              text: "make_new_password".tr(),
              fontSize: 19,
            ),
            SizedBox(
              height: edge * 0.5,
            ),
            SubtitleText(
              text: "new_password_description".tr(),
              fontSize: 14,
              color: greyColor,
              align: TextAlign.start,
            ),
            SizedBox(height: edge),
            InputTextGeneral(
              title: "new_password".tr(),
              hint: "enter_new_password".tr(),
            ),
            SizedBox(height: edge),
            InputTextGeneral(
              title: "confirm_new_password".tr(),
              hint: "enter_confirm_password".tr(),
            ),
            SizedBox(
              height: edge * 8,
            ),
            GoButton(
                fun: () {
                  context.pushNamed(Routes.forgetPasswordOtp);
                },
                titleKey: "update_password".tr())
          ],
        ),
      ),
    );
  }
}
