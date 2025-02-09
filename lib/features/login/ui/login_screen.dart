import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modern_tech/core/consts/dimensions_constants.dart';
import 'package:modern_tech/core/consts/string_consts.dart';
import 'package:modern_tech/core/helpers/extensions.dart';
import 'package:modern_tech/core/theming/color_manager.dart';
import 'package:modern_tech/core/widgets/go_button.dart';
import 'package:modern_tech/core/widgets/input_text_general.dart';
import 'package:modern_tech/core/widgets/line.dart';
import 'package:modern_tech/core/widgets/subtitle_big_text.dart';
import 'package:modern_tech/core/widgets/subtitle_text.dart';
import 'package:modern_tech/core/widgets/title_text.dart';
import 'package:modern_tech/features/login/cubit/login_cubit.dart';
import 'package:modern_tech/features/login/cubit/login_states.dart';

import '../../../core/routing/routes.dart';
import '../../../core/widgets/google_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: backgroundColor,
        height: height.h,
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 350.h,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('$imageUrl/head.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: edge),
                child: Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset('$imageUrl/app_icon.jpeg')),
              ),
            ),
            Positioned(
              top: 230.h,
              left: edge * 1.5,
              right: edge * 1.5,
              child: Container(
                  width: 300.w,
                  height: height.h,
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(right: edge * 2, left: edge * 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: edge * 1.5,
                        ),
                        InputTextGeneral(
                          title: "email".tr(),
                          hint: "enter_email".tr(),
                          controller: context.read<LoginCubit>().user,
                        ),
                        SizedBox(
                          height: edge * 0.5,
                        ),
                        InputTextGeneral(
                          title: "password".tr(),
                          hint: "enter_password".tr(),
                          isPassword: true,
                          controller: context.read<LoginCubit>().password,
                        ),
                        SizedBox(
                          height: edge * 0.5,
                        ),
                        GestureDetector(
                            onTap: () {
                              context.pushNamed(Routes.forgetPasswordScreen);
                            },
                            child: TitleText(
                              text: "forget_password_question".tr(),
                              color: lightBlue,
                              fontSize: 12,
                            )),
                        SizedBox(
                          height: edge * 1.5,
                        ),
                        BlocConsumer<LoginCubit, LoginStates>(
                            buildWhen: (previous, current) =>
                                previous != current,
                            listenWhen: (previous, current) =>
                                previous != current,
                            builder: (context, current) {
                              return GoButton(
                                fun: () {
                                  context.read<LoginCubit>().login();
                                },
                                titleKey: "login".tr(),
                                hasArrow: true,
                                loading: current is Loading,
                              );
                            },
                            listener: (context, current) {
                              current.whenOrNull(
                                emptyInput: () {
                                  context.showErrorToast("empty_input".tr());
                                },
                                successLogin: (response) async {


                                },
                                error: (error) {
                                  WidgetsBinding.instance
                                      .addPostFrameCallback((timeStamp) {
                                    context.showErrorToast(error);
                                  });
                                },
                              );
                            }),
                        SizedBox(
                          height: edge,
                        ),
                        Row(
                          children: [
                            const Expanded(child: Line()),
                            SizedBox(
                              width: edge,
                            ),
                            SubtitleText(text: "login_by".tr()),
                            SizedBox(
                              width: edge,
                            ),
                            const Expanded(child: Line())
                          ],
                        ),
                        SizedBox(
                          height: edge,
                        ),
                        GoogleButton(
                            fun: () {}, titleKey: "continue_with_google".tr()),
                        SizedBox(
                          height: edge,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SubtitleBigText(text: "don't_have_account".tr()),
                            SizedBox(
                              width: edge * 0.3,
                            ),
                            TitleText(
                              text: "register".tr(),
                              color: lightBlue,
                              fontSize: 12,
                            )
                          ],
                        )
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
