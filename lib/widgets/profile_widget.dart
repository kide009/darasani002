import 'package:darasani/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utilites/constants.dart';

class ProfileWidget extends StatelessWidget {
  ProfileWidget({
    this.title,
    this.image,
    this.height,
  });

  String? title;
  final image;
  double? height;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      minLeadingWidth: -4,
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            // "assets/Filter.png",
            height: height,
            width: 40,
          ),
        ],
      ),
      title: CustomText(
        title: title,
        fontWeight: FontWeight.w500,
        fontSize: 16,
        maxLines: 1,
        color: kBlackColor,
      ),
    );
  }
}
