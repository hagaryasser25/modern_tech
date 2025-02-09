import 'package:easy_localization/easy_localization.dart' as easy;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modern_tech/core/helpers/extensions.dart';
import 'package:modern_tech/core/theming/color_manager.dart';
import 'package:modern_tech/core/widgets/go_button.dart';
import 'package:modern_tech/core/widgets/title_text.dart';
import 'package:modern_tech/features/forget_password/data/model/check_otp_response.dart';
import 'package:modern_tech/features/forget_password/data/model/send_otp_response.dart';
import 'package:otp_pin_field/otp_pin_field.dart';
import '../../../core/consts/dimensions_constants.dart';
import '../../../core/models/otp_arguments.dart';
import '../../../core/routing/routes.dart';
import '../cubit/forget_password_cubit.dart';
import '../cubit/forget_password_states.dart';

class ForgetPasswordOtp extends StatelessWidget {
  final OtpArguments? arguments;
  const ForgetPasswordOtp({super.key, required this.arguments});

  @override
  Widget build(BuildContext context) {
    String userCode = '';
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
                    context.read<ForgetPasswordCubit>().otpController.text =
                        userCode;
                  },
                  onChange: (v) {
                    userCode = v;
                  },
                ),
              ),
            ),
            SizedBox(
              height: edge * 4,
            ),
            BlocConsumer<ForgetPasswordCubit, ForgetPasswordStates>(
                buildWhen: (previous, current) => previous != current,
                listenWhen: (previous, current) => previous != current,
                builder: (context, current) {
                  return GoButton(
                      fun: () {
                        context
                            .read<ForgetPasswordCubit>()
                            .checkOTP(arguments?.token ?? '');
                      },
                      loading: current is Loading,
                      titleKey: easy.tr("check_otp"));
                },
                listener: (context, current) {
                  current.whenOrNull(
                    emptyInput: () {
                      context.showErrorToast("empty_input".tr());
                    },
                    invalidInput: () {
                      context.showErrorToast(
                          '${context.read<ForgetPasswordCubit>().checkOtpResponse?.message?.getNameByLanguageCode()}');
                    },
                    success: (response) async {
                      if (response is CheckOtpResponse) {
                        context.pushNamedAndRemoveUntil(
                            Routes.resetPasswordScreen,
                            predicate: false);
                      }
                    },
                    error: (error) {
                      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                        context.showErrorToast(error);
                      });
                    },
                  );
                }),
            SizedBox(
              height: edge,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TitleText(
                  text: "don't_recieve".tr(),
                  fontSize: 11,
                  color: greyColor,
                ),
                SizedBox(
                  width: edge * 0.3,
                ),
                BlocConsumer<ForgetPasswordCubit, ForgetPasswordStates>(
                    buildWhen: (previous, current) => previous != current,
                    listenWhen: (previous, current) => previous != current,
                    builder: (context, current) {
                      return GestureDetector(
                          onTap: () {
                            context
                                .read<ForgetPasswordCubit>()
                                .resendOtp(arguments?.email);
                          },
                          child: TitleText(
                            text: "resend_otp".tr(),
                            color: lightBlue,
                            fontSize: 11,
                          ));
                    },
                    listener: (context, current) {
                         current.whenOrNull(
                    success: (response) async {
                      if (response is SendOtpResponse) {
                       context.showSuccessToast(context.read<ForgetPasswordCubit>().sendOtpResponse?.message?.getNameByLanguageCode());
                      }
                    },
                    error: (error) {
                      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                        context.showErrorToast(error);
                      });
                    },
                  );
                    })
              ],
            )
          ],
        ),
      ),
    );
  }
}
