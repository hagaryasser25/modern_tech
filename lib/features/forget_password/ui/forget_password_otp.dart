import 'package:easy_localization/easy_localization.dart' as easy;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modern_tech/core/helpers/extensions.dart';
import 'package:modern_tech/core/routing/routes.dart';
import 'package:modern_tech/core/theming/color_manager.dart';
import 'package:modern_tech/core/widgets/go_button.dart';
import 'package:modern_tech/core/widgets/title_text.dart';
import 'package:otp_pin_field/otp_pin_field.dart';

import '../../../core/consts/dimensions_constants.dart';
import '../../../core/consts/string_consts.dart';

class ForgetPasswordOtp extends StatelessWidget {
  const ForgetPasswordOtp({super.key});

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
          children: [
            SizedBox(
              height: edge,
            ),
            SvgPicture.asset("$imageUrl/arrow_black.svg"),
            SizedBox(
              height: edge * 0.8,
            ),
            TitleText(
              text: easy.tr("check_your_email"),
              fontSize: 16,
            ),
            SizedBox(
              height: edge * 0.5,
            ),
            TitleText(
              text: easy.tr("enter_otp"),
              fontSize: 13,
              color: greyColor,
            ),
            SizedBox(height: edge * 2),
            Directionality(
              textDirection: TextDirection.ltr,
              child: Center(
                child: OtpPinField(
                  maxLength: 6,
                  autoFillEnable: true,
                  cursorColor: lightBlue,
                  fieldHeight: 44.w,
                  fieldWidth: 44.w,
                  keyboardType: TextInputType.number,
                  highlightBorder: true,
                  otpPinFieldDecoration:
                      OtpPinFieldDecoration.defaultPinBoxDecoration,
                  otpPinFieldStyle: OtpPinFieldStyle(
                    activeFieldBorderColor: lightBlue,
                    filledFieldBorderColor: lightBlue,
                    defaultFieldBorderColor: borderColor,
                    fieldBorderRadius: curvyRadius,
                    textStyle: TextStyle(
                      color: lightBlue,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onSubmit: (v) {
                    // context.read<ForgetPasswordCubit>().otpController.text =
                    //  userCode;
                  },
                  onChange: (v) {
                    // userCode = v;
                  },
                ),
              ),
            ),
            SizedBox(
              height: edge * 4,
            ),
            GoButton(fun: () {
              context.pushNamed(Routes.resetPasswordScreen);
            }, titleKey: easy.tr("check_otp")),
            SizedBox(
              height: edge,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TitleText(text: "don't_recieve".tr(),fontSize: 11, color: greyColor,),
                SizedBox(
                  width: edge * 0.3,
                ),
                GestureDetector(
                    onTap: () {
                    //  context.pushNamed(Routes.loginScreen);
                    },
                    child: TitleText(
                      text: "resend_otp".tr(),
                      color: lightBlue,
                      fontSize: 11,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
