import 'package:chewie/chewie.dart';
import 'package:darasani/model/Course.dart';
import 'package:darasani/screens/payment/payment_detail_screen.dart';
import 'package:darasani/utilites/constants.dart';
import 'package:darasani/widgets/custom_button.dart';
import 'package:darasani/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:video_player/video_player.dart';

import '../../controllers/CourseController.dart';
import '../../utilites/helper.dart';
import '../../widgets/image_title_widget.dart';

class CourseDetailClassesLessonScreen extends StatefulWidget {
  final videoClass;
  const CourseDetailClassesLessonScreen({Key? key, this.videoClass}) : super(key: key);


  @override
  State<CourseDetailClassesLessonScreen> createState() =>
      _OnDemandClassesLessonScreenState();
}

class _OnDemandClassesLessonScreenState
    extends State<CourseDetailClassesLessonScreen> {
  bool summary = false;
  CourseController courseController = Get.put(CourseController());

  VideoPlayerController? videoPlayerController1;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    {
      intialFunction();
    }
  }

  bool isLoading = false;
  String? name;

  intialFunction() async {
    setState(() {
      isLoading = true;
    });
    setState(() {
      isLoading = false;
    });
    videoPlayerController1 = VideoPlayerController.network(
     //widget.videoClass!.fileUrl
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'
    );
    _chewieController = ChewieController(
      videoPlayerController: videoPlayerController1!,
      autoPlay: true,
      fullScreenByDefault: false,
      // aspectRatio: MediaQuery.of(context).size.width/ MediaQuery.of(context).size.height,
      autoInitialize: true,
      // looping: ,
      // controlsSafeAreaMinimum: EdgeInsets.zero,
      customControls: const CupertinoControls(
        backgroundColor: kSecondaryColor,
        iconColor: Colors.white,
      ),
      // zoomAndPan: true
    );
  }

  @override
  void dispose() {
    _chewieController!.dispose();
    videoPlayerController1!.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final DateFormat dateFormat = DateFormat('d MMM y');

    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 190,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                      child: _chewieController != null
                          ? Chewie(
                              controller: _chewieController!,
                            )
                          : CircularProgressIndicator()),
                ],
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            // Container(
            //   height: 173.h,
            //   width: MediaQuery.of(context).size.width,
            //   child: Image.asset(
            //     "assets/_video play Class on demand(COD) (1).png",
            //     fit: BoxFit.cover,
            //   ),
            // ),

            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: ListView(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  children: [
                    CustomText(
                      title: widget.videoClass!.title,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: kBlackColor,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    CustomText(
                      title:
                      widget.videoClass!.description,
                      fontSize: 11,
                      maxLines: 2,
                      fontWeight: FontWeight.w400,
                      color: kBlackColor,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        ImageTitleWidget(
                          image: "assets/Training.png",
                          title: "Price",
                        ),
                        ImageTitleWidget(
                          image: "assets/timer (1).png",
                          title: "Duration",
                        ),
                        ImageTitleWidget(
                          image: "assets/fi_book-open.png",
                          title: "Materials",
                        ),
                        ImageTitleWidget(
                          image: "assets/Vector (11).png",
                          title: "Rank",
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 40.h,
                          width: 40.w,
                          decoration: BoxDecoration(
                            color: kGreyDarkColor,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Image.asset(
                            "assets/_Avatar.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: CustomText(
                                title: 'Rita Tells',//widget.videoClass!.publisher.name,
                                fontSize: 12,
                                maxLines: 1,
                                fontWeight: FontWeight.w600,
                                color: kBlackColor,
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            CustomButton(
                              btnHeight: 20,
                              btnRadius: 5,
                              btnWidth: MediaQuery.of(context).size.width * 0.3,
                              btnColor: kGreyBackColor,
                              fontSize: 8,
                              fontWeight: FontWeight.w500,
                              title: "More About teacher",
                            ),
                          ],
                        ),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                summary = true;
                              });
                            },
                            child: summary
                                ? Container()
                                : Container(
                                    width: 80,
                                    child: CustomText(
                                      title: "Class Summary",
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10,
                                      maxLines: 1,
                                      color: kBlueColor,
                                    ),
                                  )),
                        summary
                            ? Container()
                            : Image.asset(
                                "assets/back_next.png",
                                height: 17.h,
                              ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: kGreenColor, // Set the button's background color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4), // Set the button's border radius
                            ),
                          ),
                          onPressed: () {
                            Helper.toScreen(context, PaymentDetailPage());
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.15,
                            height: 20,
                            alignment: Alignment.center,
                            child: Text(
                              "Enroll Now",
                              style: TextStyle(
                                fontSize: 8,
                                color: Colors.white, // Set the button's text color
                              ),
                            ),
                          ),
                        )

                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    summary == true
                        ? Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            decoration: BoxDecoration(
                              color: kGreyColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  title:  widget.videoClass!.title,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                  maxLines: 1,
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                CustomText(
                                  title:
                                  widget.videoClass!.description,                                  fontWeight: FontWeight.w300,
                                  fontSize: 12,
                                  color: kBlackColor,
                                ),
                              ],
                            ),
                          )
                        : Container(),
                    Divider(
                      color: kLightBlueColor,
                      thickness: 2,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    CustomText(
                      title: dateFormat.format(widget.videoClass.updatedAt),
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: kLightBlueTextColor,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 7),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: kLightBlueColor),
                      ),
                      child: CustomText(
                        title: "Lessons",
                        fontSize: 12,
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w500,
                        color: kLightBlueTextColor,
                      ),
                    ),
                    Container(
                      // height: MediaQuery.of(context).size.height * 0.45,
                      child: ListView.builder(
                        physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: widget.videoClass.lessons.length,
                        itemBuilder: (context, index) {
                          return NextSelectVideo(
                            lesson:widget.videoClass.lessons[index]
                              // home: homeTeacher[index],
                              // homeWidget: headerProfile[index],
                              );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NextSelectVideo extends StatelessWidget {
  final lesson;
  const NextSelectVideo({
    super.key, this.lesson,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: const BoxDecoration(
        color: kGreyColor,
      ),
      child: ListTile(
        visualDensity: const VisualDensity(vertical: -2),
        title: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.45,
              child: CustomText(
                title:lesson!.description,
                fontSize: 10,
                fontWeight: FontWeight.w400,
                // maxLines: 1,
                maxLines: 2,
              ),
            ),
          ],
        ),
        trailing: Container(
          width: MediaQuery.of(context).size.width * 0.27,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.download,
                size: 20,
                color: kGreyDarkColor.withOpacity(0.8),
              ),
              Image.asset(
                "assets/Vector (17).png",
                height: 15.h,
              ),
              CustomText(
                title: lesson.duration.toString() + " mnts",
                fontSize: 10,
                fontWeight: FontWeight.w400,
                // maxLines: 1,
                maxLines: 2,
              ),
              Image.asset(
                "assets/Vector 1.png",
                height: 10.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
