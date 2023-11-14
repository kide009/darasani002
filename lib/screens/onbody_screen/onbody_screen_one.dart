import 'package:darasani/utilites/constants.dart';
import 'package:darasani/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../widgets/custom_button.dart';

class OnBodyOne extends StatelessWidget {
  const OnBodyOne({
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
          Image.asset(
            "assets/body_one.png",
            height: 260.h,
          ),
          SizedBox(
            height: 15.h,
          ),
          CustomText(
            title: "Quality learning Materials",
            fontSize: 28,
            fontWeight: FontWeight.w500,
            maxLines: 1,
          ),
          SizedBox(
            height: 15.h,
          ),
          CustomText(
            title:
                "Darasani App , ensures your digital learning\n experience is enriched with Ebooks, videos,\n animations, etc ",
            fontSize: 16,
            textAlign: TextAlign.center,
            lineHeight: 1.5,
            fontWeight: FontWeight.w400,
            color: kTextColor,
          ),
        ],
      ),
    );
  }
}
