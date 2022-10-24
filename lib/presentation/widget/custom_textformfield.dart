import 'package:flutter/material.dart';

import '../styles/colors.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final double? width;
  final double margin;
  final TextEditingController? txtControl;
  final IconData? suffixIcon;
  final TextInputType textInputType;
  final String? Function(String?)? validator;
  const CustomTextFormField({
    Key? key,
    required this.hintText,
    this.margin = 40,
    this.textInputType = TextInputType.none,
    required this.validator,
    this.suffixIcon,
    this.width,
    this.txtControl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: width,
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      margin: EdgeInsets.symmetric(horizontal: margin),
      child: TextFormField(
        controller: txtControl,
        style: TextStyle(color: AppColor.lightGrey),
        cursorColor: AppColor.lightBlue,
        validator: validator,
        textAlign: TextAlign.left,
        keyboardType: textInputType,
        decoration: InputDecoration(
          suffixIcon: Icon(suffixIcon),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: AppColor.white,
              width: 1.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColor.white, width: 1.0),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: AppColor.lightGrey,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
