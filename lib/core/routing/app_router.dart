
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modern_tech/core/routing/routes.dart';
import 'package:modern_tech/features/registertaion/ui/registeration_screen.dart';

import '../../features/splash/splash_screen.dart';



class AppRouter {
  Route generateRoute(RouteSettings settings) {
  //  final arguments = settings.arguments;

    log('Navigating to: ${settings.name}');

    switch (settings.name) {
      case Routes.splashScreen:
        return _buildRoute(const SplashScreen());

      case Routes.registerationScreen:
        return _buildRoute(const RegisterationScreen());


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

