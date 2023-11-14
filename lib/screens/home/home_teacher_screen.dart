import 'package:darasani/model/home_teacher_model.dart';
import 'package:darasani/screens/home/profile_screen.dart';
import 'package:darasani/screens/home/student_profile_screen.dart';
import 'package:darasani/utilites/constants.dart';
import 'package:darasani/utilites/helper.dart';
import 'package:darasani/widgets/custom_button.dart';
import 'package:darasani/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controllers/TeacherController.dart';
import '../../model/Teacher.dart';
import '../../widgets/teacher_card_widget.dart';
class HomeTeacherScreen extends StatefulWidget {

  const HomeTeacherScreen({Key? key}) : super(key: key);

  @override
  _HomeTeacherScreenState createState() => _HomeTeacherScreenState();
}

class _HomeTeacherScreenState extends State<HomeTeacherScreen> {
  TeacherController teacherController = Get.put(TeacherController());

  @override
  void initState() {
    super.initState();

    teacherController.fetchTeachers();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGreyColor,
      appBar: AppBar(
        backgroundColor: kMainColor,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Center(
            child: Image.asset(
              "assets/back.png",
              height: 14.h,
            ),
          ),
        ),
        centerTitle: true,
        title: CustomText(
          title: "Teachers",
          fontWeight: FontWeight.w600,
          fontSize: 16,
          color: kBlackColor,
        ),
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      Helper.toScreen(context, StudentProfileScreen());
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 10),
                      height: 36.h,
                      width: 36.w,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          "assets/dp.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    child: Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        color: kSecondaryColor,
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  )
                ],
              ),
            ],
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(children: [
          ListView.builder(
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            itemCount:teacherController.teacherList.value.length,
            itemBuilder: (context, index) {
              return TeacherCardWidget(
                teacher: teacherController.teacherList.value[index],
                // homeWidget: headerProfile[index],
              );
            },
          ),
        ]),
      ),
    );
  }

}

