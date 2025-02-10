import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modern_tech/core/helpers/extensions.dart';
import 'package:modern_tech/core/theming/color_manager.dart';
import 'package:modern_tech/core/widgets/go_button.dart';
import 'package:modern_tech/core/widgets/input_text_general.dart';
import 'package:modern_tech/core/widgets/subtitle_text.dart';
import 'package:modern_tech/core/widgets/title_text.dart';
import 'package:modern_tech/features/forget_password/cubit/forget_password_cubit.dart';

import '../../../core/consts/dimensions_constants.dart';
import '../cubit/forget_password_states.dart';

class ResetPasswordScreen extends StatelessWidget {
  final String? token;
  const ResetPasswordScreen({super.key, required this.token});

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
              controller: context.read<ForgetPasswordCubit>().newPassword,
            ),
            SizedBox(height: edge),
            InputTextGeneral(
              title: "confirm_new_password".tr(),
              hint: "enter_confirm_password".tr(),
              controller:
                  context.read<ForgetPasswordCubit>().confirmationPassword,
            ),
            SizedBox(
              height: edge * 8,
            ),
            BlocConsumer<ForgetPasswordCubit, ForgetPasswordStates>(
                buildWhen: (previous, current) => previous != current,
                listenWhen: (previous, current) => previous != current,
                builder: (context, current) {
                  return GoButton(
                    fun: () {
                      context.read<ForgetPasswordCubit>().resetPassword(token);
                    },
                    titleKey: "update_password".tr(),
                    loading: current is Loading,
                  );
                },
                listener: (context, current) {
                  current.whenOrNull(
                    emptyInput: () {
                      context.showErrorToast("empty_input".tr());
                    },
                    invalidInput: () {
                      context.showErrorToast(
                          '${context.read<ForgetPasswordCubit>().updatePasswordResponse?.message?.getNameByLanguageCode()}');
                    },
                    success: (response) async {
                      context.showSuccessToast(context
                          .read<ForgetPasswordCubit>()
                          .updatePasswordResponse
                          ?.message
                          ?.getNameByLanguageCode());
                    },
                    error: (error) {
                      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                        context.showErrorToast(error);
                      });
                    },
                  );
                })
          ],
        ),
      ),
    );
  }
}
