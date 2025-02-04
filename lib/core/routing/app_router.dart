import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modern_tech/core/routing/routes.dart';
import 'package:modern_tech/features/forget_password/forget_password_screen.dart';
import 'package:modern_tech/features/forget_password/reset_password_screen.dart';
import 'package:modern_tech/features/login/ui/login_screen.dart';
import 'package:modern_tech/features/registertaion/ui/registeration_screen.dart';

import '../../features/forget_password/forget_password_otp.dart';
import '../../features/registertaion/logic/register_cubit.dart';
import '../../features/splash/splash_screen.dart';
import '../di/dependency_injection.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    //  final arguments = settings.arguments;

    log('Navigating to: ${settings.name}');

    switch (settings.name) {
      case Routes.splashScreen:
        return _buildRoute(const SplashScreen());


        case Routes.registerationScreen:
        return _buildRoute(
          BlocProvider(
            create: (_) => getIt<RegisterCubit>(),
            child: const RegisterationScreen(),
          ),
        );

      case Routes.loginScreen:
        return _buildRoute(const LoginScreen());

      case Routes.forgetPasswordScreen:
        return _buildRoute(const ForgetPasswordScreen());

      case Routes.forgetPasswordOtp:
        return _buildRoute(const ForgetPasswordOtp());

      case Routes.resetPasswordScreen:
        return _buildRoute(const ResetPasswordScreen());

      

      default:
        return _buildRoute(
          Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }

// this function act as native navigation for android and ios
  Route _buildRoute(Widget page, {bool useCupertino = false}) {
    if (useCupertino || TargetPlatform.iOS == defaultTargetPlatform) {
      return CupertinoPageRoute(builder: (_) => page);
    } else {
      return MaterialPageRoute(builder: (_) => page);
    }
  }
}
