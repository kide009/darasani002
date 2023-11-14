import 'package:chewie/chewie.dart';
import 'package:darasani/utilites/constants.dart';
import 'package:darasani/widgets/custom_button.dart';
import 'package:darasani/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

class ImageTitleWidget extends StatelessWidget {
  const ImageTitleWidget({
    this.image,
    this.title,
  });

  final image;
  final title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          image,
          // "assets/Training.png",
          height: 15.h,
        ),
        SizedBox(
          height: 5.h,
        ),
        CustomText(
          title: title,
          // "5 Classes",
          fontSize: 10,
          color: kBlackColor,
        )
      ],
    );
  }
}
