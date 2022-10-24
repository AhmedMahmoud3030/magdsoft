import 'package:flutter/material.dart';

import '../styles/colors.dart';

class LineDecore extends StatelessWidget {
  final double width;
  final double height;
  final double radius;
  final Color color;
  const LineDecore({
    Key? key,
    required this.width,
    required this.height,
    required this.radius,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color, //Border.all
        /*** The BorderRadius widget  is here ***/
        borderRadius: BorderRadius.all(
          Radius.circular(radius),
        ),
      ),
    );
  }
}
