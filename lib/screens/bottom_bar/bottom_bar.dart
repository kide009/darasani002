import 'package:darasani/screens/home/ebooks_screen.dart';
import 'package:darasani/screens/home/home_screen.dart';
import 'package:darasani/screens/home/home_teacher_screen.dart';
import 'package:darasani/screens/home/live_classes.dart';
import 'package:darasani/screens/home/on_demand_classes_lesson_screen.dart';
import 'package:darasani/screens/home/on_demand_classes_screen.dart';
import 'package:darasani/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../provider/main_provider.dart';
import '../../utilites/constants.dart';
import '../audio_book/audio_book_screen.dart';
import '../home/video_class_screen.dart';

class BottomBar extends StatefulWidget {
  BottomBar({
    this.val,
  });

  final int? val;

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  List iconList = [
    HomeScreen(),
    OnDemandClassesScreen(),
    EBookScreen(),
    VideoClassScreen(),
    AudioBookScreen(),
  ];

  // late int currentindex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.val != null) {
      Provider.of<MainProvider>(context, listen: false)
          .changeIndex(widget.val!);
    }
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MainProvider>(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(systemNavigationBarColor: kMainColor),
      child: Scaffold(
        extendBody: false,
        backgroundColor: kMainColor,
        resizeToAvoidBottomInset: false,
        body: iconList[provider.index],
        bottomNavigationBar: BottomAppBar(
          elevation: 15,
          color: Colors.transparent,
          shape: const CircularNotchedRectangle(),
          clipBehavior: Clip.antiAlias,
          notchMargin: 5.0,
          child: Container(
            height: 75,
            child: ClipRRect(
              child: BottomNavigationBar(
                backgroundColor: kMainColor,
                type: BottomNavigationBarType.fixed,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                currentIndex: provider.index,
                onTap: (index) {
                  Provider.of<MainProvider>(context, listen: false)
                      .changeIndex(index);
                },
                items: [
                  BottomNavigationBarItem(
                    label: "HOME",
                    icon: provider.index == 0
                        ? Column(
                            children: [
                              Image.asset(
                                "assets/u_home-alt.png",
                                height: 22.h,
                                color: kSecondaryColor,
                              ),
                              SizedBox(
                                height: 7.h,
                              ),
                              CustomText(
                                title: "HOME",
                                fontSize: 10,
                                color: kSecondaryColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          )
                        : Column(
                            children: [
                              Image.asset(
                                "assets/u_home-alt.png",
                                height: 22.h,
                              ),
                              SizedBox(
                                height: 7.h,
                              ),
                              CustomText(
                                title: "HOME",
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                  ),
                  // 2nd

                  BottomNavigationBarItem(
                    label: "HOME",
                    icon: provider.index == 1
                        ? Column(
                            children: [
                              Image.asset(
                                "assets/Training (1).png",
                                height: 20.h,
                                color: kSecondaryColor,
                              ),
                              SizedBox(
                                height: 7.h,
                              ),
                              CustomText(
                                title: "COURSES",
                                fontSize: 10,
                                color: kSecondaryColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          )
                        : Column(
                            children: [
                              Image.asset(
                                "assets/Training (1).png",
                                height: 20.h,
                              ),
                              SizedBox(
                                height: 7.h,
                              ),
                              CustomText(
                                title: "COURSES",
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                  ),
                  // 3rd

                  BottomNavigationBarItem(
                    label: "HOME",
                    icon: provider.index == 2
                        ? Column(
                            children: [
                              Image.asset(
                                "assets/Vector (13).png",
                                height: 20.h,
                                color: kSecondaryColor,
                              ),
                              SizedBox(
                                height: 7.h,
                              ),
                              CustomText(
                                title: "E-LIBRARY",
                                color: kSecondaryColor,
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          )
                        : Column(
                            children: [
                              Image.asset(
                                "assets/Vector (13).png",
                                height: 20.h,
                              ),
                              SizedBox(
                                height: 7.h,
                              ),
                              CustomText(
                                title: "E-LIBRARY",
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                  ),

                  // 4

                  BottomNavigationBarItem(
                      label: "HOME",
                      icon: provider.index == 3
                          ? Column(
                              children: [
                                Image.asset(
                                  "assets/Video Call.png",
                                  height: 20.h,
                                  color: kSecondaryColor,
                                ),
                                SizedBox(
                                  height: 7.h,
                                ),
                                CustomText(
                                  title: "VIDEO-CLASS",
                                  fontSize: 10,
                                  color: kSecondaryColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ],
                            )
                          : Column(
                              children: [
                                Image.asset(
                                  "assets/Video Call.png",
                                  height: 20.h,
                                ),
                                SizedBox(
                                  height: 7.h,
                                ),
                                CustomText(
                                  title: "VIDEO-CLASS",
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                ),
                              ],
                            )),

// 5th

                  BottomNavigationBarItem(
                      label: "HOME",
                      icon: provider.index == 4
                          ? Column(
                              children: [
                                Image.asset(
                                  "assets/Event Accepted Tentatively.png",
                                  height: 20.h,
                                  color: kSecondaryColor,
                                ),
                                SizedBox(
                                  height: 7.h,
                                ),
                                CustomText(
                                  title: "AUDIO-BOOK",
                                  fontSize: 10,
                                  color: kSecondaryColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ],
                            )
                          : Column(
                              children: [
                                Image.asset(
                                  "assets/Event Accepted Tentatively.png",
                                  height: 20.h,
                                ),
                                SizedBox(
                                  height: 7.h,
                                ),
                                CustomText(
                                  title: "AUDIO-BOOK",
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                ),
                              ],
                            )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
