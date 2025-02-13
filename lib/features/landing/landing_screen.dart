import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modern_tech/core/consts/landing_enum.dart';
import 'package:modern_tech/core/consts/string_consts.dart';
import 'package:modern_tech/core/theming/color_manager.dart';
import 'package:modern_tech/core/widgets/title_text.dart';
import 'package:modern_tech/features/home/home_screen.dart';

import '../../core/consts/dimensions_constants.dart';

class LandingScreen extends StatefulWidget {
  final dynamic landingIndex;
  const LandingScreen({super.key, this.landingIndex});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  late dynamic currentLandingIndex;

  @override
  void initState() {
    super.initState();
    currentLandingIndex = widget.landingIndex ?? LandingIndex.home;
  }

  final List<Map<String, dynamic>> icons = [
    {
      'id': '1',
      'icon': '$imageUrl/home.svg',
      'name': 'home'.tr(),
      'index': LandingIndex.home
    },
    {
      'id': '2',
      'icon': '$imageUrl/service.svg',
      'name': "book_service".tr(),
      'index': LandingIndex.service
    },
    {
      'id': '3',
      'icon': '$imageUrl/orders.svg',
      'name': "orders".tr(),
      'index': LandingIndex.orders
    },
    {
      'id': '4',
      'icon': '$imageUrl/settings.svg',
      'name': "settings".tr(),
      'index': LandingIndex.settings
    }
  ];

  final List<Widget> _screens = [
    HomeScreen(),
    Center(child: const Text("book_service").tr()),
    Center(child: const Text("orders").tr()),
    Center(child: const Text("settings").tr()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: _screens[currentLandingIndex.index],
      bottomNavigationBar: Stack(
        children: [
          Container(
            height: 115.h,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(
                
                image: AssetImage('$imageUrl/bottom_nav.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List.generate(
                  icons.length,
                  (index) => GestureDetector(
                    onTap: () {
                          currentLandingIndex = LandingIndex.values[index];
                          setState(() {
                          });
                        },
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: icons[index]['id'] == '2' ? 100.w : 40.w,
                          right: icons[index]['id'] == '1' ? 40.w : 0,
                          top: 40.h),
                      child: _buildNavBarItem(
                          '${icons[index]['name']}',
                          '${icons[index]['icon']}',
                          '${icons[index]['index']}','${icons[index]['id']}'),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
              bottom: 60.h,
              right: 173.w, // Adjust the FAB position to overlap the bottom bar
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: darkBlue, borderRadius: BorderRadius.circular(30)),
                child: Image.asset(
                  '$imageUrl/pot.png',
                  height: 100,
                  width: 100,
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildNavBarItem(String label, String iconPath, dynamic index, String id) {
    return Column(
      children: [
        SvgPicture.asset(
          iconPath,
          height: 24, colorFilter:    ColorFilter.mode(
                   (currentLandingIndex.index ) == int.parse(id) - 1 ? primaryColor : greyText, BlendMode.srcIn)  ,
        ),
        SizedBox(
          height: edge / 2,
        ),
        TitleText(
          text: label,
          fontSize: 10,
          color: (currentLandingIndex.index ) == int.parse(id) - 1 ? blackColor : greyText,
        ),
      ],
    );
  }


}
