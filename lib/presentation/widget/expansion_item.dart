import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';

class ExpansionItem extends StatelessWidget {
  final String title;
  final String paragraph;
  const ExpansionItem({
    Key? key,
    required this.title,
    required this.paragraph,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: ExpansionTile(
        //expandedAlignment: Alignment.centerLeft,
        iconColor: AppColor.black,
        childrenPadding: EdgeInsets.all(8),
        collapsedBackgroundColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        title: Text(
          title,
          style: TextStyle(
            color: AppColor.darkBlue,
            fontSize: 18,
          ),
        ),
        children: [
          Text(
            paragraph,
            textAlign: TextAlign.start,
            style: TextStyle(
              color: AppColor.black,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
