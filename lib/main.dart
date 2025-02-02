import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:modern_tech/core/services/notification_service.dart';
import 'package:modern_tech/modern_tech_app.dart';

import 'core/helpers/app_utilities.dart';
import 'core/routing/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
//  await setupGetIt();
  NotificationService notificationService = NotificationService();
  await notificationService.init();
    runApp(EasyLocalization(
    supportedLocales: const [
      Locale(
        'en',
      ),
      Locale(
        'ar',
      ),
      Locale(
        'fr',
      ),
    ],
    saveLocale: true,
    startLocale: Locale(AppUtilities().languageCode),
    path: 'assets/translations',
    fallbackLocale: Locale(AppUtilities().languageCode),
    child: ModernTechApp(
      appRouter: AppRouter(),
    ),
  ));

}


