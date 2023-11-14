import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:darasani/controllers/CourseController.dart';
import 'package:darasani/controllers/DiscussionController.dart';
import 'package:darasani/controllers/LibraryController.dart';
import 'package:darasani/controllers/MediaController.dart';
import 'package:darasani/controllers/TeacherController.dart';
import 'package:darasani/model/Advertisement.dart';
import 'package:darasani/screens/bottom_bar/bottom_bar.dart';
import 'package:darasani/screens/home/ebooks_screen.dart';
import 'package:darasani/screens/home/home_teacher_screen.dart';
import 'package:darasani/screens/home/on_demand_classes_lesson_screen.dart';
import 'package:darasani/screens/home/on_demand_classes_screen.dart';
import 'package:darasani/screens/home/profile_screen.dart';
import 'package:darasani/screens/home/student_profile_screen.dart';
import 'package:darasani/screens/home/video_class_detail_screen.dart';
import 'package:darasani/services/RemoteServices.dart';
import 'package:darasani/utilites/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../controllers/HomeController.dart';
import '../../model/live_class_model.dart';
import '../../utilites/helper.dart';
import '../../widgets/StudentWidget.dart';
import '../../widgets/audio_book_widget.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/discussion_and_forums_widget.dart';
import '../../widgets/live_class_home_widget.dart';
import '../../widgets/main_home_widget.dart';
import '../../widgets/on_demand_widget.dart';
import '../../widgets/see_all_widget_text.dart';
import '../../widgets/teacher_widget.dart';
import '../audio_book/audio_book_screen.dart';
import 'course_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CarouselController controller = CarouselController();
  TeacherController teacherController = Get.put(TeacherController());
  CourseController courseController = Get.put(CourseController());
  LibraryController libraryController = Get.put(LibraryController());
  HomeController homeController = Get.put(HomeController());
  MediaController audioMediaController = Get.put(MediaController());

  @override
  void initState() {
    super.initState();
    homeController.fetchAdvertisements();
    homeController.fetchStudentAdvertisements();
    teacherController.fetchTeachers();
    courseController.fetchCourses();
    libraryController.fetchLibraries();
    audioMediaController.fetchAudios();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGreyColor,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: kMainColor,
              padding: EdgeInsets.only(left: 15, right: 15, top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/splash_icon.png",
                    height: 70.h,
                  ),
                  CustomText(
                    title: "Darasani",
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: kSecondaryColor,
                  ),
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
              ),
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                children: [
                  CarouselSlider.builder(
                    carouselController: controller,
                    itemCount: homeController.AdvertisementList.value.length,
                    itemBuilder: (context, index, int pageViewIndex) {
                      if ( homeController.AdvertisementList.value.length>0) {
                        return MainHomeWidget(
                          index: index,
                          advertisement: homeController.AdvertisementList[0],
                        );// You can return a placeholder or an empty widget
                      }
                      else{
                        return MainHomeWidget(
                          index: index,
                          advertisement: new Advertisement(id: "", title: "", coverImg: "https://i.ibb.co/Fs9Z021/Section-Thumb.png", creatorId: "", description: "", createdAt: new DateTime.now(), updatedAt: new DateTime.now()),

                        );
                      }

                    },
                    options: CarouselOptions(
                      height: 180,
                      // aspectRatio: 16 / 9,
                      viewportFraction: 0.99,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      // enlargeFactor: 0.3,
                      // onPageChanged: callbackFunction,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {

                      Helper.toScreen(context, HomeTeacherScreen());
                    },
                    child: SeeAllWidgetText(
                      title: "Teachers",
                      trailing: "See all",
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.16,
                    decoration: BoxDecoration(
                      color: kMainColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Obx(()=> ListView.builder(
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: teacherController.teacherList.value.length,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {

                            Helper.toScreen(context, ProfileScreen(teacher:teacherController.teacherList.value[index]  ,));
                          },
                          child: TeacherWidget(
                                teacher:teacherController.teacherList.value[index] ,
                              ),
                        );
                      },
                    )),
                  ),
                  GestureDetector(
                    onTap: () {
                      Helper.toRemoveUntiScreen(
                          context,
                          BottomBar(
                            val: 1,
                          ));
                    },
                    child: SeeAllWidgetText(
                      title: "Courses",
                      trailing: "See all",
                    ),
                  ),
                  Container(
                    height: 300.h,
                    child:Obx( ()=> ListView.builder(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: courseController.courseList.value.length,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(right: 15),
                          child: GestureDetector(
                            onTap: () {
                              Helper.toScreen(
                                  context, CourseDetailClassesLessonScreen(videoClass:courseController.courseList.value[index]));
                            },
                            child: LiveClassWidget(
                              course: courseController.courseList.value[index],
                            ),
                          ),
                        );
                      },
                    )),
                  ),
                  SeeAllWidgetText(
                    title: "One to  one sessions",
                    // trailing: "See all",
                  ),
                  Card(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: kMainColor,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.52,
                                child: CustomText(
                                  title:
                                      "Do you Need personal help with your  homework or exam preparations?. Pick a subject, pick your time and get help now!",
                                  fontSize: 10,
                                  lineHeight: 2,
                                  maxLines: 3,
                                  fontWeight: FontWeight.w300,
                                  color: kBlackColor,
                                ),
                              ),
                              Container(
                                height: 67.h,
                                width: MediaQuery.of(context).size.width * 0.22,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    "assets/_One to one session image Image.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: const Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: CustomButton(
                                  onPressed: ()=>{

                                  },
                                  btnWidth:
                                      MediaQuery.of(context).size.width * 0.5,
                                  title: "Book a session now",
                                  textColor: kBlackColor,
                                  fontSize: 14,
                                  btnColor: kWhiteLightColor,
                                  btnRadius: 4,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Helper.toRemoveUntiScreen(
                          context,
                          BottomBar(
                            val: 2,
                          ));
                    },
                    child: SeeAllWidgetText(
                      title: "Ebooks, Past Papers,& Notes",
                      trailing: "See all",
                    ),
                  ),
                  Container(
                    height: 270.h,
                    child: Obx(() => ListView.builder(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: libraryController.libraryList.value.length,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(right: 15, bottom: 10),
                          child: EBookWidget(
                                library:libraryController.libraryList.value[index]
                              ),
                        );
                      },
                    )),
                  ),
                  GestureDetector(
                    onTap: () {
                      Helper.toScreen(
                          context,
                          BottomBar(
                            val: 4,
                          ));
                    },
                    child: SeeAllWidgetText(
                      title: "Audio Books",
                      trailing: "See all",
                    ),
                  ),
                  Container(
                    height: 160.h,
                    child: Obx( ()=> ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: audioMediaController.audioList.value.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(right: 15),
                          child:  AudioBookWidget(
                              audio:audioMediaController.audioList.value[index]
                              ),
                        );
                      },
                    )),
                  ),
                  GestureDetector(
                    onTap: () {
                      Helper.toScreen(
                          context,
                          BottomBar(
                            val: 3,
                          ));
                    },
                    child: SeeAllWidgetText(
                      title: "Students",
                    ),
                  ),

                  Container(
                    height: MediaQuery.of(context).size.height * 0.16,
                    decoration: BoxDecoration(
                      color: kMainColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListView.builder(
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: homeController.AdvertisementStudentList.value.length,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemBuilder: (context, index) {
                        return StudentWidget(

                          advertisement: homeController.AdvertisementStudentList.value[index],
                            // home: homeTeacher[index],
                            // homeWidget: headerProfile[index],
                            );
                      },
                    ),
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
