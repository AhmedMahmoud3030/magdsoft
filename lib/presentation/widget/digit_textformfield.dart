import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../styles/colors.dart';

class DigitTextField extends StatelessWidget {
  final TextEditingController txtControl;
  const DigitTextField({
    Key? key,
    required this.txtControl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        color: AppColor.white,
        borderRadius: BorderRadius.circular(10),
      ),
      width: 70,
      child: TextFormField(
        controller: txtControl,
        maxLength: 1,
        style: TextStyle(color: AppColor.lightBlue),
        cursorColor: AppColor.lightBlue,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly,
        ],
        decoration: InputDecoration(
          counterText: '',
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
        ),
      ),
    );
  }
}
