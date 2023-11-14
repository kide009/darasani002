import 'package:flutter/material.dart';

import '../../utilites/constants.dart';
import '../../widgets/custom_text.dart';

class CustomListTile extends StatelessWidget {
  CustomListTile({
    this.title,
    this.image,
    this.height,
  });

  final title;
  final image;
  double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: kLightBlueColor),
          child: Center(
            child: Image.asset(
              image,
              // "assets/Training.png",
              height: height,
            ),
          ),
        ),
        title: CustomText(
          title: title,
          // "Physics, Chemistry, bilology",
          color: kBlackColor,
          fontWeight: FontWeight.w500,
          fontSize: 12,
          maxLines: 1,
        ),
      ),
    );
  }
}
