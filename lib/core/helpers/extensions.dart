//import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modern_tech/core/helpers/app_utilities.dart';
import 'package:modern_tech/core/theming/color_manager.dart';
import 'package:modern_tech/core/widgets/subtitle_text.dart';

import '../models/language_model.dart';
import '../routing/direction_routing.dart';

extension Navigation on BuildContext {
  //modified
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    final RouteSettings settings =
        RouteSettings(name: routeName, arguments: arguments);
    final Route<dynamic>? route =
        Navigator.of(this).widget.onGenerateRoute!(settings);

    if (route == null ||  (route is! MaterialPageRoute && route is! CupertinoPageRoute)) {
      throw Exception(
        "Route $routeName is not defined in onGenerateRoute or is not a MaterialPageRoute.",
      );
    }
    final Widget page;
    if (route is PageRoute) {
      page = route.buildPage(this, route.animation ?? const AlwaysStoppedAnimation(1.0), route.secondaryAnimation ?? const AlwaysStoppedAnimation(0.0));
    } else {
      throw Exception("Route $routeName does not support building a page.");
    }
    return Navigator.of(this).push(
      CustomPageRoute(
        page: page,
        duration: const Duration(milliseconds: 300),
        direction: AppUtilities().isLTR
            ? SlideDirection.leftToRight
            : SlideDirection.rightToLeft,
      ),
    );
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    final RouteSettings settings =
        RouteSettings(name: routeName, arguments: arguments);
    final Route<dynamic>? route =
        Navigator.of(this).widget.onGenerateRoute!(settings);
    if (route == null ||   (route is! MaterialPageRoute && route is! CupertinoPageRoute)) {
      throw Exception(
          "Route $routeName is not defined in onGenerateRoute or is not a MaterialPageRoute.");
    }
    final Widget page;
    if (route is PageRoute) {
      page = route.buildPage(this, route.animation ?? const AlwaysStoppedAnimation(1.0), route.secondaryAnimation ?? const AlwaysStoppedAnimation(0.0));
    } else {
      throw Exception("Route $routeName does not support building a page.");
    }
    return Navigator.of(this).pushReplacement(
      CustomPageRoute(
        page: page,
        duration: const Duration(milliseconds: 300),
        direction: AppUtilities().isLTR
            ? SlideDirection.leftToRight
            : SlideDirection.rightToLeft,
      ),
    );
  }

  // Future<dynamic> pushNamedAndRemoveUntil(String routeName, {Object? arguments, required bool predicate}) {
  //   final RouteSettings settings =
  //       RouteSettings(name: routeName, arguments: arguments);
  //   final Route<dynamic>? route = Navigator.of(this).widget.onGenerateRoute!(settings);
  //   if (route == null || (route is! MaterialPageRoute && route is! CupertinoPageRoute)) {
  //     throw Exception(
  //         "Route $routeName is not defined in onGenerateRoute or is not a MaterialPageRoute.");
  //   }
  //   if(route is MaterialPageRoute){
  //     return Navigator.of(this).pushAndRemoveUntil(
  //         CustomPageRoute(
  //           page: route.builder(this),
  //           duration: const Duration(milliseconds: 300),
  //           direction: AppUtilities().isLTR
  //               ? SlideDirection.leftToRight
  //               : SlideDirection.rightToLeft,
  //         ),
  //             (Route<dynamic> route) => predicate);
  //   }
  //   else if(route is CupertinoPageRoute){
  //      return Navigator.of(this).pushAndRemoveUntil(
  //         CustomPageRoute(
  //           page: route.builder(this),
  //           duration: const Duration(milliseconds: 300),
  //           direction: AppUtilities().isLTR
  //               ? SlideDirection.leftToRight
  //               : SlideDirection.rightToLeft,
  //         ),
  //             (Route<dynamic> route) => predicate);
  //   }
  //   else
  //     {
  //       return;
  //     }
  //
  // }
  Future<dynamic> pushNamedAndRemoveUntil(String routeName, {Object? arguments, required bool predicate}) {
    final RouteSettings settings = RouteSettings(name: routeName, arguments: arguments);
    final Route<dynamic>? route = Navigator.of(this).widget.onGenerateRoute!(settings);
    if (route == null || (route is! MaterialPageRoute && route is! CupertinoPageRoute)) {
      throw Exception(
          "Route $routeName is not defined in onGenerateRoute or is not a MaterialPageRoute.");
    }
    final Widget page;
    if (route is PageRoute) {
      page = route.buildPage(this, route.animation ?? const AlwaysStoppedAnimation(1.0), route.secondaryAnimation ?? const AlwaysStoppedAnimation(0.0));
    } else {
      throw Exception("Route $routeName does not support building a page.");
    }
    return Navigator.of(this).pushAndRemoveUntil(
      CustomPageRoute(
        page: page,
        duration: const Duration(milliseconds: 300),
        direction: AppUtilities().isLTR
            ? SlideDirection.leftToRight
            : SlideDirection.rightToLeft,
      ),
          (Route<dynamic> route) => predicate,
    );
  }




  void pop() => Navigator.of(this).pop();


  showErrorToast(String msg) {
    Flushbar(
      messageText: Row(
        children: [
          Expanded(
              child: SubtitleText(
            text: msg,
            align: TextAlign.start,
            color: backgroundColor,
          )),
          const Icon(
            Icons.close,
            color: backgroundColor,
          )
        ],
      ),
      messageColor: backgroundColor,
      messageSize: 18,
      // titleColor: AppUI.mainColor,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      // maxWidth: double.infinity,
      isDismissible: true,
      duration: const Duration(seconds: 2),
      flushbarPosition: FlushbarPosition.BOTTOM,
      barBlur: .1,
      backgroundColor: Colors.redAccent,
      borderColor: Colors.redAccent,
      margin: const EdgeInsets.all(8),
      borderRadius: BorderRadius.circular(10),
    ).show(this);
  }

 showSuccessToast(message) {
   Flushbar(
     messageText: Row(
       children: [
         Expanded(
             child: SubtitleText(
               text: message,
               align: TextAlign.start,
               color: backgroundColor,
             )),

       ],
     ),
     messageColor:backgroundColor,
     messageSize: 18,
     // titleColor: AppUI.mainColor,
     padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
     // maxWidth: double.infinity,
     isDismissible: true,
     duration: const Duration(seconds: 2),
     flushbarPosition: FlushbarPosition.BOTTOM,
     barBlur: .1,
     backgroundColor: lightBlue,
     borderColor: lightBlue,
     margin: const EdgeInsets.all(8),
     borderRadius: BorderRadius.circular(10),
   ).show(this);
 }
 
}

extension NameExtension on Name {
  String? getNameByLanguageCode() {
    switch (AppUtilities().languageCode) {
      case 'ar':
        return ar;
      case 'en':
        return en;
      default:
        return null;
    }
  }
}
