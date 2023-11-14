import 'package:darasani/model/live_class_model.dart';
import 'package:darasani/screens/home/on_demand_classes_lesson_screen.dart';
import 'package:darasani/utilites/helper.dart';
import 'package:darasani/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utilites/constants.dart';
import '../../widgets/custom_text.dart';
import '../model/Course.dart';

class LiveClassWidget extends StatelessWidget {
  final Course? course;

  const LiveClassWidget({super.key,  this.course});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Helper.toScreen(context, OnDemandClassesLessonScreen());
      },
      child: Card(
        elevation: 5,
        margin: EdgeInsets.zero,
        child: Container(
          decoration: BoxDecoration(
            color: kMainColor,
            borderRadius: BorderRadius.circular(5),
          ),
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          width: MediaQuery.of(context).size.width * 0.44,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 89.h,
                child: Image.asset(
                  course!.coverImg,
                  fit: BoxFit.fill,
                ),
              ),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 3,
                    width: 3,
                  ),
                  Positioned(
                    top: -10,
                    child: Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.25,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: kGreenColor),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 20,
                                    width: 20,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Image.asset(
                                        course!.coverImg,
                                        // "assets/_TeacherPhoto.png",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Flexible(
                                    child: CustomText(
                                      title: course!.title,
                                      // title: "Kartik ",
                                      fontSize: 10,
                                      color: kMainColor,
                                      maxLines: 1,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              CustomText(
                title: course!.description,
                color: kBlackColor,
                fontSize: 9,
                fontWeight: FontWeight.w600,
                maxLines: 2,
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/Vector (15).png",
                    height: 10.h,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  CustomText(
                    title: "",
                    color: kGreyDarkColor,
                    fontSize: 9,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  CustomText(
                    title: "Price",
                    color: kRedColor,
                    fontSize: 9,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/calendar.png",
                    height: 12.h,
                  ),

                  CustomText(
                    title: " Cartegory",
                    fontSize: 6,
                    maxLines: 1,
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                children: [
                  Image.asset(
                    "assets/timer.png",
                    height: 12.h,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  CustomText(
                    title: "12:40 P:M -",
                    fontSize: 6,
                    maxLines: 1,
                  ),
                  CustomText(
                    title: "03:40 P:M",
                    fontSize: 6,
                    maxLines: 1,
                  ),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              Column(
                children: [
                  CustomButton(
                    btnWidth: MediaQuery.of(context).size.width * 0.2,
                    title: "Enroll now",
                    btnColor: kGreenDarkColor,
                    textColor: kMainColor,
                    fontSize: 10,
                    btnHeight: 30.h,
                    btnRadius: 4,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
