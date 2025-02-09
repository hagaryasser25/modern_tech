import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modern_tech/core/helpers/extensions.dart';
import 'package:modern_tech/core/theming/color_manager.dart';
import 'package:modern_tech/core/widgets/go_button.dart';
import 'package:modern_tech/core/widgets/input_text_general.dart';
import 'package:modern_tech/core/widgets/title_text.dart';
import 'package:modern_tech/features/forget_password/cubit/forget_password_cubit.dart';
import 'package:modern_tech/features/forget_password/cubit/forget_password_states.dart';

import '../../../core/consts/dimensions_constants.dart';
import '../../../core/consts/string_consts.dart';
import '../../../core/routing/routes.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

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
            GestureDetector(
                onTap: () {
                  context.pop();
                },
                child: SvgPicture.asset("$imageUrl/arrow_black.svg")),
            SizedBox(
              height: edge * 0.8,
            ),
            TitleText(
              text: "forget_password".tr(),
              fontSize: 16,
            ),
            SizedBox(
              height: edge * 0.5,
            ),
            TitleText(
              text: "enter_your_email".tr(),
              fontSize: 13,
              color: greyColor,
            ),
            SizedBox(height: edge),
            InputTextGeneral(
              title: "your_email".tr(),
              hint: "your_email".tr(),
              controller: context.read<ForgetPasswordCubit>().user,
            ),
            SizedBox(
              height: edge * 2.5,
            ),
            BlocConsumer<ForgetPasswordCubit, ForgetPasswordStates>(
                buildWhen: (previous, current) => previous != current,
                listenWhen: (previous, current) => previous != current,
                builder: (context, current) {
                  return GoButton(
                      fun: () {
                        context.read<ForgetPasswordCubit>().sendOtp();
                      },
                      titleKey: "reset_password".tr());
                },
                listener: (context, current) {
                  current.whenOrNull(
                    emptyInput: () {
                      context.showErrorToast("empty_input".tr());
                    },

                    invalidInput: () {
                      context.showErrorToast('${context.read<ForgetPasswordCubit>().sendOtpResponse?.message?.getNameByLanguageCode()}');
                    },

                    success: (response) async {
                      context.pushNamedAndRemoveUntil(Routes.forgetPasswordOtp, predicate: false);
                    },
                    error: (error) {
                      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                        context.showErrorToast(error);
                      });
                    },
                  );
                }),
          ],
        ),
      ),
    );
  }
}
