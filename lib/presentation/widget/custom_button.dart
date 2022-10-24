import 'package:flutter/material.dart';

import '../router/app_router.dart';
import '../styles/colors.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback function;
  final String title;
  final double radius;
  final double? width;

  const CustomButton({
    Key? key,
    required this.function,
    required this.title,
    this.radius = 25.0,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        width: width,
        height: 40,
        margin: EdgeInsets.symmetric(horizontal: 40),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(radius),
            ),
            gradient: LinearGradient(
              colors: [
                AppColor.darkBlue,
                AppColor.lightBlue,
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColor.lightBlue.withOpacity(0.2),
                spreadRadius: 4,
                blurRadius: 10,
                offset: Offset(0, 3),
              )
            ]),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontFamily: "Netflix",
              fontWeight: FontWeight.w600,
              fontSize: 18,
              letterSpacing: 0.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
