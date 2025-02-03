import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../consts/dimensions_constants.dart';

class Line extends StatelessWidget {
  const Line({this.lineWidth,super.key});
  final double? lineWidth ;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.5 ,width: lineWidth??width.w,
      color: const Color(0xffCACAD9),
    );
  }
}
