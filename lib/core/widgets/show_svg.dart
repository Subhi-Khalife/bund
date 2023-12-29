import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ShowSvg extends StatelessWidget {
  const ShowSvg(
    this.assetName, {
    Key? key,
    this.color,
    this.height,
    this.width,
    this.fit = BoxFit.contain,
  }) : super(key: key);
  final String assetName;
  final Color? color;
  final double? width;
  final double? height;
  final BoxFit fit;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(assetName,width:width,height: height,color: color,);
  }
}
