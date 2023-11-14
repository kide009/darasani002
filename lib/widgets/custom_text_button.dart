import 'package:darasani/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../utilites/constants.dart';
import '../../widgets/custom_drop_down.dart';
import '../../widgets/custom_text.dart';

class CustomTextButton extends StatefulWidget {
  final VoidCallback? onPressed; // Add this line

  CustomTextButton({
    this.title,
    this.fontsize,
    this.onPressed,
  });

  String? title;
  double? fontsize;

  @override
  State<CustomTextButton> createState() => _CustomTextButtonState();
}

class _CustomTextButtonState extends State<CustomTextButton> {
  bool selectTime = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
         // Trigger the onPressed callback when tapped

        setState(() {
          selectTime = !selectTime;
        });
      },
      child: Container(
        height: 35,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: selectTime ? kSecondaryColor : kBlueColor,
          ),
        ),
        child: Center(
          child: CustomText(
            title: widget.title,
            fontWeight: FontWeight.w400,
            fontSize: widget.fontsize ?? 10,
            color: kBlueColor,
          ),
        ),
      ),
    );
  }
}
