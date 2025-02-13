import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/consts/dimensions_constants.dart';
import '../../../../core/consts/string_consts.dart';
import '../../../../core/theming/color_manager.dart';
import '../../../../core/widgets/subtitle_big_text.dart';
import '../../../../core/widgets/subtitle_text.dart';
import '../../../../core/widgets/title_text.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: backgroundColor,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: edge),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 130.h,
              child: const DrawerHeader(
                decoration: BoxDecoration(
                  color: backgroundColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    TitleText(
                      text: "John Doe",
                      fontSize: 16,
                      fontFamily: "Inter",
                    ),
                    SubtitleText(
                      text: "johndoe@gmail.com",
                      color: semiDarkGrey,
                      fontSize: 16,
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: edge / 2, vertical: edge),
              child: Column(
                children: [
                  listTile("book_icon.svg", "book_appointment".tr()),
                  SizedBox(
                    height: edge,
                  ),
                  listTile("delivery_icon.svg", "deliver_pieces".tr()),
                  SizedBox(
                    height: edge,
                  ),
                  listTile("replace_icon.svg", "replace_device".tr()),
                  SizedBox(
                    height: edge,
                  ),
                  listTile("new_icon.svg", "buy_device".tr()),
                  SizedBox(
                    height: edge,
                  ),
                  listTile("complains_icon.svg", "complains".tr()),
                  SizedBox(
                    height: edge,
                  ),
                  listTile("offers_icon.svg", "offers".tr()),
                  SizedBox(
                    height: edge,
                  ),
                  listTile("job_icon.svg", "work_offers".tr()),
                  SizedBox(
                    height: edge,
                  ),
                  listTile("course_icon.svg", "training_courses".tr()),
                  SizedBox(
                    height: edge,
                  ),
                  listTile("contact_icon.svg", "contact_us".tr()),
                  SizedBox(
                    height: edge,
                  ),
                  listTile("logout_icon.svg", "logout".tr()),
                  SizedBox(
                    height: edge,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget listTile(String image, String text, ) {
    return Row(
      children: [
        SvgPicture.asset("$imageUrl/$image"),
        SizedBox(
          width: edge,
        ),
        SubtitleBigText(
          text: text,
          color: text == "logout".tr() ? redColor : listColor,
          fontSize: 18,
        )
      ],
    );
  }
}
