import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modern_tech/core/consts/dimensions_constants.dart';
import 'package:modern_tech/core/consts/string_consts.dart';
import 'package:modern_tech/core/helpers/extensions.dart';
import 'package:modern_tech/core/routing/routes.dart';
import 'package:modern_tech/core/theming/color_manager.dart';
import 'package:modern_tech/core/widgets/go_button.dart';
import 'package:modern_tech/core/widgets/input_text.dart';
import 'package:modern_tech/core/widgets/subtitle_big_text.dart';
import 'package:modern_tech/core/widgets/title_text.dart';

import '../logic/register_cubit.dart';
import '../logic/register_states.dart';

class RegisterationScreen extends StatelessWidget {
  const RegisterationScreen({super.key});

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
                padding: EdgeInsets.only(top: edge * 0.7),
                child: Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset('$imageUrl/app_icon.jpeg')),
              ),
            ),
            Positioned(
              top: 170.h,
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
                          height: edge * 2,
                        ),
                        SvgPicture.asset("$imageUrl/arrow_black.svg"),
                        SizedBox(
                          height: edge * 0.5,
                        ),
                        TitleText(text: "register".tr()),
                        SizedBox(
                          height: edge * 0.5,
                        ),
                        InputText(
                          title: "full_name".tr(),
                          hint: "hint_name".tr(),
                          controller: context.read<RegisterCubit>().name,
                        ),
                        SizedBox(
                          height: edge * 0.5,
                        ),
                        InputText(
                          title: "email".tr(),
                          hint: "hint_email".tr(),
                          controller: context.read<RegisterCubit>().email,
                        ),
                        SizedBox(
                          height: edge * 0.5,
                        ),
                        InputText(
                          title: "phone_number".tr(),
                          hint: "hint_phone".tr(),
                          controller: context.read<RegisterCubit>().phoneNumber,
                        ),
                        SizedBox(
                          height: edge * 0.5,
                        ),
                        InputText(
                          title: "password".tr(),
                          hint: "hint_password".tr(),
                          isPassword: true,
                          controller: context.read<RegisterCubit>().password,
                        ),
                        SizedBox(
                          height: edge * 2,
                        ),
                        BlocBuilder<RegisterCubit, RegisterStates>(
                          buildWhen: (previous, current) => previous != current,
                          builder: (context, state) {
                            return                         GoButton(
                          fun: () {
                            context.read<RegisterCubit>().register();
                          },
                          titleKey: "register".tr(),
                          hasArrow: true,
                        );
                          },
                        ),

                        SizedBox(
                          height: edge,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SubtitleBigText(text: "already_have_email".tr()),
                            SizedBox(
                              width: edge * 0.3,
                            ),
                            GestureDetector(
                                onTap: () {
                                  context.pushNamed(Routes.loginScreen);
                                },
                                child: TitleText(
                                  text: "login".tr(),
                                  color: lightBlue,
                                  fontSize: 12,
                                ))
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
