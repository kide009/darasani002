import 'package:darasani/screens/home/student_profile_screen.dart';
import 'package:darasani/utilites/helper.dart';
import 'package:darasani/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../utilites/constants.dart';
import '../../widgets/custom_drop_down.dart';
import '../../widgets/custom_list_tile_widget.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_text_button.dart';

class ProfileScreen extends StatefulWidget {
  final teacher;
  const ProfileScreen({Key? key,this.teacher}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  String? selectLevel;
  String? subject;

  DateTime? selectedDate;
  String? age;

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        builder: (BuildContext? context, Widget? child) {
          return Theme(
            data: ThemeData.light().copyWith(
              colorScheme: const ColorScheme.light(
                primary: kSecondaryColor,
                surface: kMainColor,
                onSurface: Colors.black,
              ),

              // dialogBackgroundColor: Colors.blue[900],
            ),
            child: child!,
          );
        },
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1800),
        lastDate: DateTime(2500));
    if (picked != null && picked != selectedDate) {
      setState(
        () {
          selectedDate = picked;
          // var formattedDate = DateFormat('MM-dd-yyyy').format(selectedDate);
          // dateSelected = formattedDate;

          age = (DateTime.now().difference(selectedDate!).inDays / 365)
              .toInt()
              .toString();
        },
      );
      print(age);
    }
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
          title: "Teacher Profile",
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
                        child: Image.network(
                          widget.teacher!.profileImg ,
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
          ),
        ],
      ),
      body: Container(
        child: ListView(
          children: [
            SizedBox(
              height: 40.h,
            ),
            Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black54,
                        blurRadius: 4.0,
                        offset: Offset(0.0, 0.75)),
                  ],
                  color: kMainColor),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: 10,
                        width: 10,
                      ),
                      Positioned(
                        top: -30,
                        child: Container(
                          margin: const EdgeInsets.only(right: 10),
                          height: 72.h,
                          width: 72.w,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.network(
                              widget.teacher!.profileImg,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  CustomText(
                    title: widget.teacher.name,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: kBlackColor,
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomText(
                    title: widget.teacher.role,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: kGreyDarkColor,
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomText(
                    title:
                    widget.teacher.instructorProfile.bio,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: kBlackColor,
                    // maxLines: 1,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  const Divider(
                    color: kGreyLightColor,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  CustomListTile(
                    title: widget.teacher.instructorProfile.teachesSubjects,
                    image: "assets/Training.png",
                    height: 15.h,
                  ),
                  CustomListTile(
                    title: widget.teacher.instructorProfile.cost,
                    image: "assets/supermarket.png",
                    height: 18.h,
                  ),
                  CustomListTile(
                    title: widget.teacher.instructorProfile.experience,
                    image: "assets/humbleicons_user-asking.png",
                    height: 20.h,
                  ),
                  CustomListTile(
                    title: widget.teacher.instructorProfile.teachesClasses,
                    image: "assets/Vector (11).png",
                    height: 13.h,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => selectDate(context),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          // width: MediaQuery.of(context).size.width * 0.3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: kBorderColor,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/calander.png",
                                height: 14.h,
                              ),
                              SizedBox(
                                width: 12.w,
                              ),
                              CustomText(
                                title: selectedDate == null
                                    ? "select date"
                                    : DateFormat('MM - dd - yyyy')
                                        .format(selectedDate!),
                                fontSize: 10,
                                color: kGreyDarkColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: CustomDropDown(
                          hintText: "select Subject",
                          value: subject,
                          image: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 5),
                                child: Image.asset(
                                  "assets/drop.png",
                                  height: 7.h,
                                ),
                              )
                            ],
                          ),
                          list: ["Physics", "Chemistry", "bilology"],
                          onChanged: (val) {
                            setState(() {
                              subject = val;
                            });
                          },
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.28,
                        child: CustomDropDown(
                          hintText: "Select Level",
                          value: selectLevel,
                          image: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 5),
                                child: Image.asset(
                                  "assets/drop.png",
                                  height: 7.h,
                                  color: kGreenColor,
                                ),
                              )
                            ],
                          ),
                          color: kGreenColor,
                          list: const ["Level 1", "Level 2", "Level 3"],
                          onChanged: (val) {
                            setState(
                              () {
                                selectLevel = val;
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),

                  Column(
                    children: [
                      CustomButton(
                        btnWidth: MediaQuery.of(context).size.width * 0.7,
                        btnColor: kGreenDarkColor,
                        fontSize: 12,
                        btnHeight: 45.h,
                        textColor: kMainColor,
                        btnRadius: 10,
                        title: "Book Me for one to one session",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
