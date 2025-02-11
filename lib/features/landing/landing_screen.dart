import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modern_tech/core/consts/landing_enum.dart';
import 'package:modern_tech/core/consts/string_consts.dart';
import 'package:modern_tech/core/theming/color_manager.dart';
import 'package:modern_tech/core/widgets/title_text.dart';

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
    Center(child: const Text("home").tr()),
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
            height: 150.h,
            width: double.infinity,
            decoration: const BoxDecoration(
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
                  (index) => Padding(
                    padding: EdgeInsets.only(
                        left: icons[index]['id'] == '2' ? 100.w : 40.w,
                        right: icons[index]['id'] == '1' ? 40.w : 0,
                        top: 60.h),
                    child: GestureDetector(
                        onTap: () {
                          currentLandingIndex = LandingIndex.values[index];
                          setState(() {
                            
                          });
                        },
                        child: _buildNavBarItem(
                            '${icons[index]['name']}',
                            '${icons[index]['icon']}',
                            '${icons[index]['index']}')),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
              bottom: 70.h,
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

  Widget _buildNavBarItem(String label, String iconPath, dynamic index) {
    return Column(
      children: [
        SvgPicture.asset(
          iconPath,
          height: 24,
        ),
        SizedBox(
          height: edge / 2,
        ),
        TitleText(
          text: label,
          fontSize: 10,
          color: greyText,
        ),
      ],
    );
  }

/*
  Widget _bottomNavBar() {
    return CurvedNavBar(
      actionButton: CurvedActionBar(
          onTab: (value) {
            /// perform action here
          },
          activeIcon: Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
                color: Colors.white, shape: BoxShape.circle),
            child: const Icon(
              Icons.camera_alt,
              size: 50,
              color: Colors.orange,
            ),
          ),
          inActiveIcon: Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
                color: Colors.black, shape: BoxShape.circle),
            child: const Icon(
              Icons.camera_alt_outlined,
              size: 50,
              color: Colors.orange,
            ),
          ),
          text: ""),
      activeColor: Colors.blue,
      navBarBackgroundColor: backgroundColor,
      inActiveColor: Colors.black45,
      appBarItems: [
        FABBottomAppBarItem(
            activeIcon: const Icon(
              Icons.home,
              color: primaryColor,
            ),
            inActiveIcon: const Icon(
              Icons.home,
              color: Colors.black26,
            ),
            text: ("home").tr()),
        FABBottomAppBarItem(
            activeIcon: const Icon(
              Icons.wallet_giftcard,
              color: Colors.blue,
            ),
            inActiveIcon: const Icon(
              Icons.wallet_giftcard,
              color: Colors.black26,
            ),
            text: ("book_service").tr()),
        FABBottomAppBarItem(
            activeIcon: const Icon(
              Icons.wallet_giftcard,
              color: Colors.blue,
            ),
            inActiveIcon: const Icon(
              Icons.wallet_giftcard,
              color: Colors.black26,
            ),
            text: ("orders").tr()),
        FABBottomAppBarItem(
            activeIcon: const Icon(
              Icons.wallet_giftcard,
              color: Colors.blue,
            ),
            inActiveIcon: const Icon(
              Icons.wallet_giftcard,
              color: Colors.black26,
            ),
            text: ("settings").tr())
      ],
      bodyItems: [
        Center(child: const Text("home").tr()),
        Center(child: const Text("book_service").tr()),
        Center(child: const Text("orders").tr()),
        Center(child: const Text("settings").tr()),
      ],
      actionBarView: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.orange,
      ),
    );
  }
  */
}
