import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../animation/slideleft_toright.dart';
import '../animation/slideright_toleft.dart';
import 'constants.dart';

class Helper {
  static setHeight(BuildContext context, {height = 1}) {
    return MediaQuery.of(context).size.height * height;
  }

  static setWidth(BuildContext context, {width = 1}) {
    return MediaQuery.of(context).size.width * width;
  }

  static toScreen(context, screen) {
    Navigator.push(context, SlideRightToLeft(page: screen));
  }

  static toReplacementScreenSlideRightToLeft(context, screen) {
    Navigator.pushReplacement(context, SlideRightToLeft(page: screen));
  }

  static toReplacementScreenSlideLeftToRight(context, screen) {
    Navigator.pushReplacement(context, SlideLeftToRight(page: screen));
  }

  static toRemoveUntiScreen(context, screen) {
    Navigator.pushAndRemoveUntil(
        context, SlideRightToLeft(page: screen), (route) => false);
  }

  static onWillPop(context, screen) {
    Navigator.pushAndRemoveUntil(
        context, SlideRightToLeft(page: screen), (route) => false);
  }

  static showSnack(context, message, {color = kMainColor, duration = 2}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          message,
          style: TextStyle(fontSize: 15.h, color: kMainColor),
        ),
        backgroundColor: color,
        duration: Duration(seconds: duration)));
  }

  static offlinePopUp(String text, BuildContext context) {
    Future.delayed(Duration(milliseconds: 100), () async {
      Helper.showSnack(context, text);
    });
  }

  static circulProggress(context) {
    const Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(kMainColor),
      ),
    );
  }

  static showLog(message) {
    log("APP SAYS: $message");
  }

  static boxDecoration(Color color, double radius) {
    BoxDecoration(
        color: color, borderRadius: BorderRadius.all(Radius.circular(radius)));
  }

}
