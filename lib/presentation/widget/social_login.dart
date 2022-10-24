import 'package:flutter/material.dart';

import '../styles/colors.dart';

class SocialLogin extends StatelessWidget {
  final String assetName;
  const SocialLogin({
    Key? key,
    required this.assetName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Image.asset(
        assetName,
        fit: BoxFit.scaleDown,
      ),
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: AppColor.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }
}
