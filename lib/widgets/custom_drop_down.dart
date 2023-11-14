import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utilites/constants.dart';

class CustomDropDown extends StatefulWidget {
  final String? hintText, value;
  final List<String> list;
  final Function(String?)? onChanged;
  final double? fontSize, height, hintFontSize;
  Widget? image;
  Color? color;

  CustomDropDown({
    super.key,
    this.hintText,
    this.value,
    required this.list,
    this.onChanged,
    this.fontSize,
    this.height,
    this.hintFontSize,
    this.image,
    this.color,
  });

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height?.h ?? 48.h,
      decoration: BoxDecoration(
          // color: kTextFieldBorderColor,
          border: Border.all(color: Colors.transparent),
          borderRadius: BorderRadius.circular(5)),
      child: DropdownButton(
        elevation: 0,
        itemHeight: 65,
        underline: Container(
          height: 1.0,
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.transparent, width: 0.0))),
        ),
        hint: Container(
            margin: EdgeInsets.only(left: 10),
            child: Text(
              widget.hintText!,
              style: TextStyle(
                color: widget.color ?? kBlackColor,
                fontWeight: FontWeight.w600,
                fontSize: widget.hintFontSize?.h ?? 12.h,
              ),
            )),
        dropdownColor: kTextFieldColor,
        icon: widget.image ??
            Icon(
              Icons.arrow_drop_down_sharp,
            ),
        isExpanded: true,
        value: widget.value,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: kBlackColor,
        ),
        onChanged: widget.onChanged,
        items: widget.list.map((valueItem) {
          return DropdownMenuItem(
            value: valueItem,
            child: Container(
                margin: EdgeInsets.only(left: 15),
                child: Text(
                  valueItem,
                  style: TextStyle(
                    fontSize: widget.fontSize?.h ?? 12.h,
                    fontWeight: FontWeight.w500,
                    color: widget.color ?? kBlackColor,
                  ),
                )),
          );
        }).toList(),
      ),
    );
  }
}
