import 'package:flutter/material.dart';

import 'custom_inkwell_btn.dart';
import 'custom_text.dart';

class CustomButtonWithIconInStart extends StatelessWidget {
  CustomButtonWithIconInStart(
      {this.onPressed,
      this.btnHeight,
      this.btnWidth,
      this.btnColor,
      this.btnBorderWidth,
      this.btnBorderColor,
      this.btnRadius,
      this.title,
      this.textColor,
      this.fontSize,
      this.lineHeight,
      this.fontWeight,
      this.assetName,
      this.scale,
      this.assetColor,
      Key? key})
      : super(key: key);
  String? assetName;
  Color? assetColor;
  double? scale;
  Function? onPressed;
  double? btnHeight;
  double? lineHeight;
  double? btnWidth;
  Color? btnColor;
  double? btnBorderWidth;
  Color? btnBorderColor;
  double? btnRadius;
  String? title;
  Color? textColor;
  double? fontSize;
  FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return CustomInkWell(
      onTap: onPressed,
      child: Container(
        width: btnWidth ?? double.infinity,
        height: btnHeight ?? 44,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: btnColor,
            border: Border.all(
                width: btnBorderWidth == null ? 0 : btnBorderWidth!,
                color: btnBorderColor == null
                    ? Colors.transparent
                    : btnBorderColor!),
            borderRadius:
                BorderRadius.circular(btnRadius == null ? 0 : btnRadius!)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              assetName!,
              scale: scale,
              color: assetColor ?? null,
            ),
            CustomText(
              title: title!,
              color: textColor,
              fontSize: fontSize,
              fontWeight: fontWeight,
              lineHeight: lineHeight,
              textAlign: TextAlign.center,
            ),
            SizedBox()
          ],
        ),
      ),
    );
  }
}
