import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/consts/dimensions_constants.dart';
import 'core/consts/string_consts.dart';
import 'core/helpers/app_utilities.dart';
import 'core/services/navigation_service.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';

class ModernTechApp extends StatelessWidget {
  final AppRouter appRouter;

  const ModernTechApp({required this.appRouter, super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(width, height),
      minTextAdapt: true,
      
        child: MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: Locale(AppUtilities().languageCode),
          navigatorKey: NavigationService.navigatorKey,
          title: appName,
          theme: ThemeData(/*
            colorScheme: ColorScheme(
                surface: backgroundColor.getColor(),
                onSurface: subTitleColor.getColor(),
                error: buttonRedColor,
                brightness: Brightness.light,
                onError: Colors.yellow,
                onPrimary: secondButtonColor.getColor(),
                onSecondary: Colors.black,
                primary: primaryColor,
                secondary: Colors.yellowAccent,
                surfaceTint: Colors.transparent),
                */
            //cardColor: backgroundColor,
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.splashScreen,
          onGenerateRoute: appRouter.generateRoute,
          builder: (context, widget) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaler: TextScaler.noScaling,
              ),
              child: widget!,
            );
          },
        ),
      );
    
  }
}
