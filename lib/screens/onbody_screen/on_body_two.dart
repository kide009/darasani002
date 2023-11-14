import 'package:darasani/utilites/constants.dart';
import 'package:darasani/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../widgets/custom_button.dart';

class OnBodyTwo extends StatelessWidget {
  const OnBodyTwo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 50.h,
          ),
          Container(
            height: 260,
            width: 260,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
            ),
            child: Image.asset(
              "assets/Ellipse 154.png",
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          CustomText(
            title: "Live Classes",
            fontSize: 28,
            fontWeight: FontWeight.w500,
            maxLines: 1,
          ),
          SizedBox(
            height: 15.h,
          ),
          CustomText(
            title:
                "Learning has to be fun, and can happen anywhere\n at any time: Darasan App will ensure you dont miss\n your favorite class wherever you are",
            fontSize: 14,
            textAlign: TextAlign.center,
            lineHeight: 1.5,
            maxLines: 3,
            fontWeight: FontWeight.w400,
            color: kTextColor,
          ),
        ],
      ),
    );
  }
}
