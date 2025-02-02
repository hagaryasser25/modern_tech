import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modern_tech/core/consts/dimensions_constants.dart';
import 'package:modern_tech/core/consts/string_consts.dart';
import 'package:modern_tech/core/theming/color_manager.dart';

class RegisterationScreen extends StatelessWidget {
  const RegisterationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: height.h,
        child: Stack(
          children: [
            
            // Background Image Container
            Container(
              width: double.infinity,
              height: 350.h,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('$imageUrl/head.png'), // Make sure the path is correct
                  fit: BoxFit.cover,
                ),
              ),
            ),
        
            // Overlay Container
            Positioned(
              top: 150.h,  // Adjust position as needed
              left: 30.w,  // Responsive positioning
              right: 30.w, // Responsive width
              child: Container(
                width: 300.w,
                height: height.h,
                decoration: BoxDecoration(
                  color: backgroundColor, // Semi-transparent
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    "Overlay Container",
                    style: TextStyle(fontSize: 20.sp, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
