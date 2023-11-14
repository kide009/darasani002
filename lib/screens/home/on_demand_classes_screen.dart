import 'package:darasani/controllers/CourseController.dart';
import 'package:darasani/model/live_class_model.dart';
import 'package:darasani/screens/home/on_demand_classes_lesson_screen.dart';
import 'package:darasani/utilites/helper.dart';
import 'package:darasani/widgets/custom_button.dart';
import 'package:darasani/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../model/Course.dart';
import '../../utilites/config.dart';
import '../../utilites/constants.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_textfield.dart';
import 'package:intl/intl.dart';

import 'course_detail_screen.dart';
class OnDemandClassesScreen extends StatefulWidget {
  const OnDemandClassesScreen({Key? key}) : super(key: key);

  @override
  State<OnDemandClassesScreen> createState() => _OnDemandClassesScreenState();
}

class _OnDemandClassesScreenState extends State<OnDemandClassesScreen> {
  CourseController courseController = Get.put(CourseController());
  TextEditingController searchController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGreyColor,
      appBar: AppBar(
        backgroundColor: kMainColor,
        elevation: 0,
        // leading: GestureDetector(
        //   onTap: () {
        //     Navigator.pop(context);
        //   },
        //   child: Center(
        //     child: Image.asset(
        //       "assets/back.png",
        //       height: 14.h,
        //     ),
        //   ),
        // ),
        centerTitle: true,
        title: CustomText(
          title: "Courses",
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
                  Container(
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
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    courseController.filterCoursesBySubject("Biology");
                  },
                  child: Text(
                    "Biology",
                    style: TextStyle(
                      fontSize: 14,
                      // Add your text styling here
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    courseController.filterCoursesBySubject("Physics");
                  },
                  child: Text(
                    "Physics",
                    style: TextStyle(
                      fontSize: 14,
                      // Add your text styling here
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    courseController.filterCoursesBySubject("History");
                  },
                  child: Text(
                    "History",
                    style: TextStyle(
                      fontSize: 14,
                      // Add your text styling here
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    courseController.filterCoursesBySubject("Maths");
                  },
                  child: Text(
                    "Maths",
                    style: TextStyle(
                      fontSize: 14,
                      // Add your text styling here
                    ),
                  ),
                ),
              ],
            )
,
            SizedBox(
              height: 25.h,
            ),
            Container(
              padding: EdgeInsets.only(left: 16), // Adjust the margin value as needed
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: kGreyDarkColor),
              ),
              child: TextField(
                controller: searchController,
                onChanged: (searchQuery) {
                  // Call a method to filter your courseList based on searchQuery
                  if(searchQuery.isNotEmpty) {
                    courseController.filterCoursesBySearch(searchQuery);
                  }
                },
                decoration: InputDecoration(
                  hintText: "Placeholder",
                  hintStyle: TextStyle(fontSize: 14, color: kHinTextColor),
                  border: InputBorder.none,
                  suffixIcon: GestureDetector(

                    child: Icon(
                      Icons.search,
                      color: kBlackColor,
                    ),
                  ),
                ),
                style: TextStyle(fontSize: 14, color: kBlackColor),
                cursorColor: kBlackColor,
              ),
            ),

            SizedBox(
              height: 20.h,
            ),
            Column(
              children: [
                Obx( () => GridView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 8,
                      childAspectRatio: 0.55),
                  itemCount: courseController.courseList.value.length,
                  itemBuilder: (context, index) {
                    return LiveClassWidget(
                      course: courseController.courseList.value[index],
                    );
                  },
                )),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}

class LiveClassWidget extends StatelessWidget {
  final Course? course;

  const LiveClassWidget({super.key, this.course});



  @override
  Widget build(BuildContext context) {
    final DateFormat dateFormat = DateFormat('d MMM y');
    final DateFormat timeFormat = DateFormat('h:mm a');

    return GestureDetector(
      onTap: () {
        Helper.toScreen(context, CourseDetailClassesLessonScreen(videoClass:course));
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
                child: Image.network(
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
                                      child:Image.network(
                                        course!.coverImg,
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
                    title: "Live Classes",
                    color: kRedColor,
                    fontSize: 9,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              //  final DateFormat customDateFormat= DateFormat('d MMM y');
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/calendar.png",
                    height: 12.h,
                  ),
                  CustomText(
                    title: dateFormat.format(course!.startDate),
                    fontSize: 6,
                    maxLines: 1,
                  ),
                  CustomText(
                    title: dateFormat.format(course!.endDate),
                    fontSize: 6,
                    maxLines: 1,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: kGreyLightColor,
                    ),
                    child: CustomText(
                      title: course!.price == 0
                          ? 'Free'
                          : course!.price.toStringAsFixed(0).replaceAllMapped(
                        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                            (Match match) => '${match[1]},',
                      ),
                      fontSize: 7,
                    ),

                  )
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
                    title: timeFormat.format(course!.startTime) +" -",
                    fontSize: 6,
                    maxLines: 1,
                  ),
                  CustomText(
                    title: timeFormat.format(course!.endDate),
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
      ),
    );
  }
}
