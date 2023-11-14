import 'package:darasani/utilites/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../model/live_class_model.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text.dart';

class LiveClassHomeWidget extends StatelessWidget {
  final LiveClassModel? live;

  const LiveClassHomeWidget({Key? key, this.live});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.only(bottom: 5),
      child: Container(
        decoration: BoxDecoration(
          color: kMainColor,
          borderRadius: BorderRadius.circular(5),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        width: MediaQuery.of(context).size.width * 0.44,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              fit: StackFit.passthrough,
              children: [
                Container(
                  height: 89.h,
                  child: Image.asset(
                    live!.image,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned.fill(
                  top: 10,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomButton(
                          title: "Live",
                          btnColor: kRedColor,
                          textColor: kMainColor,
                          btnWidth: 30,
                          btnHeight: 22,
                          fontSize: 10,
                          btnRadius: 5,
                        ),
                        CustomButton(
                          title: "Biology",
                          btnColor: kSecondaryColor,
                          textColor: kBlackColor,
                          btnWidth: 45,
                          btnHeight: 22,
                          btnRadius: 5,
                          fontSize: 10,
                        ),
                      ],
                    ),
                  ),
                )
              ],
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
                        padding: const EdgeInsets.all(5),
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
                                      live!.dp,
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
                                    title: live!.name,
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
              title: live!.discription,
              // "Nike Air Max 270 React ENGfgfgf  ddfdfdf",
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
                  title: "9",
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
                  title: "24 Jan 2023 -",
                  fontSize: 6,
                  maxLines: 1,
                ),
                CustomText(
                  title: " 24 Jan 2023",
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
                  title: "Enroll Now",
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
    );
  }
}
