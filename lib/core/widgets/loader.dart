
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart' as loader;
import 'package:modern_tech/core/theming/color_manager.dart';


class Loader extends StatelessWidget {
  const Loader({this.size,this.color,super.key});
  final double? size;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return loader.SpinKitThreeBounce(
      color:color?? backgroundColor,
      size:size?? 30.0,);
  }
}
