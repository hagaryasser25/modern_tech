import 'package:flutter/material.dart';
import 'package:modern_tech/core/helpers/extensions.dart';

import '../../core/consts/string_consts.dart';
import '../../core/routing/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();

  
}



class _SplashScreenState extends State<SplashScreen> {
   @override
     void initState() {
    super.initState();
    // Navigate after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
     context.pushNamedAndRemoveUntil(Routes.registerationScreen, predicate: false);
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("$imageUrl/splash.png"), 
            fit: BoxFit.cover, 
          ),
        ),
    )
    );
  }
}