import 'package:darasani/utilites/constants.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_text.dart';

class SeeAllWidgetText extends StatelessWidget {
  SeeAllWidgetText({
    this.title,
    this.trailing,
  });

  String? title;
  String? trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            title: title,
            color: kBlackColor,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
          CustomText(
            title: trailing,
            color: kBlueColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
