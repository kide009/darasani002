import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomText extends StatelessWidget {
  CustomText(
      {this.title,
      this.color,
      this.fontSize,
      this.fontWeight,
      this.fontStyle,
      this.textAlign,
      this.decoration,
      this.maxLines,
      this.lineHeight,
      this.overflow,
      this.fontFamily,
      Key? key})
      : super(key: key);
  String? title;
  Color? color;
  double? fontSize;
  double? lineHeight;
  FontWeight? fontWeight;
  FontStyle? fontStyle;
  TextAlign? textAlign;
  TextDecoration? decoration;
  int? maxLines;
  TextOverflow? overflow;
  String? fontFamily;

  @override
  Widget build(BuildContext context) {
    return Text(
      title ?? "",
      textAlign: textAlign ?? TextAlign.left,
      maxLines: maxLines,
      style: TextStyle(
          fontSize: fontSize == null ? 15.h : fontSize!.h,
          color: color,
          fontWeight: fontWeight,
          height: lineHeight,
          fontFamily: fontFamily,
          decoration: decoration,
          fontStyle: fontStyle,
          overflow: overflow ?? null),
    );
  }
}
