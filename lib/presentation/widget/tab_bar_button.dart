import 'package:flutter/material.dart';

import '../styles/colors.dart';

class TabBarButton extends StatelessWidget {
  final String title;
  final bool isExbanded;
  final VoidCallback tab;
  const TabBarButton({
    Key? key,
    required this.title,
    this.isExbanded = false,
    required this.tab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tab,
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: isExbanded ? AppColor.black : AppColor.lightGrey,
              fontSize: 18,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: AppColor.lightBlue,
            ),
            width: isExbanded ? 10 : 0,
            height: isExbanded ? 10 : 0,
          ),
        ],
      ),
    );
  }
}
