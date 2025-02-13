import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modern_tech/core/consts/string_consts.dart';
import 'package:modern_tech/core/theming/color_manager.dart';
import 'package:modern_tech/core/widgets/subtitle_text.dart';
import 'package:modern_tech/core/widgets/title_text.dart';
import 'package:modern_tech/features/home/ui/widgets/drawer_widget.dart';

import '../../core/consts/dimensions_constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: SubtitleText(
          text: "welcome".tr(),
          color: greyTitle,
          fontSize: 20,
        ),
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: SvgPicture.asset(
              '$imageUrl/drawer.svg',
              width: 25,
              height: 25,
            ),
          ),
        ),
      ),
      drawer: const DrawerWidget(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: edge),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: edge * 3,
                ),
                const TitleText(
                  text: "هاجر ياسر",
                  fontSize: 18,
                )
              ],
            ),
            SizedBox(
              height: edge * 1.5,
            ),
            TitleText(
              text: "our_service".tr(),
              fontSize: 20,
              color: darkGrey,
            ),
            SizedBox(
              height: edge,
            ),
            Column(
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('$imageUrl/frame.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Image.asset('$imageUrl/service_image.png'),
                ),
                SizedBox(
                  height: edge / 2,
                ),
                TitleText(
                  text: "maintenance_adaptation".tr(),
                  fontSize: 14,
                  color: lightBlack,
                )
              ],
            ),
            SizedBox(
              height: edge * 2,
            ),
            TitleText(
              text: "special_offers".tr(),
              fontSize: 20,
              color: darkGrey,
            ),

/*
            Scrollbar(
      trackVisibility: true,
      thickness: 8,
      controller: controller,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          height: 127.h,
          child: CarouselSlider(
              items: model?.data?.map(
                    (e) => Padding(  
                      padding: EdgeInsets.only(left: 8.w, right: 8.w),
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.only(),
                          child: CachedNetworkImage(
                            width: double.infinity,
                            fit: BoxFit.cover,
                            imageUrl: e.image!,
                            placeholder: (context, url) => Shimmer.fromColors(
                              baseColor: Colors.grey.withOpacity(.3),
                              highlightColor: Colors.grey.withOpacity(.5),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: blackColor.getColorTheme(
                                      sharedPreferences?.getString("theme")),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList()??[],
              options: CarouselOptions(
                height: 220.h,
                viewportFraction: 1.0,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 5),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                scrollDirection: Axis.horizontal,
              )),
        ),
      ),
    );
    */
          ],
        ),
      ),
    );
  }
}
