import 'package:darasani/utilites/constants.dart';
import 'package:darasani/utilites/helper.dart';
import 'package:darasani/widgets/custom_button.dart';
import 'package:darasani/widgets/custom_text.dart';
import 'package:darasani/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    this.image,
    this.title,
    this.onTap, // Add the onTap callback here
  });

  final image;
  final title;
  final Function()? onTap; // Define the onTap callback

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Attach the onTap callback to the GestureDetector
      child: Container(
        height: 54.h,
        width: MediaQuery.of(context).size.width * 0.43,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
        ),
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                image,
                height: 20.h,
              ),
              const SizedBox(
                width: 8,
              ),
              Flexible(
                child: CustomText(
                  title: title,
                  color: kTextColor,
                  fontSize: 16,
                  fontFamily: "Rubik",
                  fontWeight: FontWeight.w300,
                  maxLines: 1,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
