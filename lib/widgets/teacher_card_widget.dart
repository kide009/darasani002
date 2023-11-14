import 'package:darasani/model/home_teacher_model.dart';
import 'package:darasani/screens/home/profile_screen.dart';
import 'package:darasani/screens/home/student_profile_screen.dart';
import 'package:darasani/utilites/constants.dart';
import 'package:darasani/utilites/helper.dart';
import 'package:darasani/widgets/custom_button.dart';
import 'package:darasani/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TeacherCardWidget extends StatelessWidget {
  final HomeTeacherModel? home;
 final teacher;
  const TeacherCardWidget({Key? key, this.home, this.teacher});

  @override
  Widget build(BuildContext context) {
    print(teacher.name);
    return GestureDetector(
      onTap: () {
        Helper.toScreen(context, ProfileScreen(teacher:teacher ,));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: kGreyColor,
          borderRadius: BorderRadius.circular(4),
          boxShadow: const [
            BoxShadow(
                color: Colors.black54,
                blurRadius: 2.0,
                offset: Offset(0.0, 0.75)),
          ],
        ),
        // margin: EdgeInsets.only(bottom: 20),
        // elevation: 2,
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(4),
        // ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 87.h,
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.network(
                      teacher!.profileImg,
                      // "assets/teacher1.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 18.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      title: teacher!.name,
                      color: kBlueColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                      maxLines: 1,
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    CustomText(
                      title: teacher!.instructorProfile.teachesSubjects,
                      color: kGreenColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      maxLines: 1,
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    CustomText(
                      title: teacher!.instructorProfile.teachesClasses,
                      color: kGreyDarkColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      maxLines: 1,
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    CustomText(
                      title: teacher!.instructorProfile.experience,
                      color: kBlueColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      maxLines: 1,
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                    btnRadius: 10,
                    btnWidth: MediaQuery.of(context).size.width * 0.3,
                    title: "Check Availability ",
                    btnHeight: 25.h,
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    textColor: kMainColor,
                    btnColor: kGreenColor,
                  ),
                 // CustomText(
                  //  title: home!.time,
                  //  fontWeight: FontWeight.w400,
                  //  fontSize: 12,
                  //  maxLines: 1,
                  //  color: kGreyDarkColor,
                  ////)
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
    );
  }
}
