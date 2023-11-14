import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utilites/constants.dart';
import '../../utilites/helper.dart';
import '../../widgets/audio_book_widget.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text.dart';
import '../home/student_profile_screen.dart';
import 'audio_book_listening.dart';
import 'audio_book_screen.dart';

class AudioBookSummaryScreen extends StatefulWidget {
  final audio;
  const AudioBookSummaryScreen({Key? key,this.audio}) : super(key: key);

  @override
  State<AudioBookSummaryScreen> createState() => _AudioBookSummaryScreenState();
}

class _AudioBookSummaryScreenState extends State<AudioBookSummaryScreen> {
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
          title: "Audio Books",
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
          ),
        ],
      ),
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 160.h,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20),
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 7,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(right: 15),
                    child: AudioBookWidget(
                        audio:widget.audio,
                        // homeWidget: headerProfile[index],
                        ),
                  );
                },
              ),
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
                        title: "Isaac Tan",
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
                      onPressed: () {
                        Helper.toScreen(context, AudioBookListening(attachment: widget.audio,description: widget.audio.shortDescription));
                      },
                      btnHeight: 20,
                      btnRadius: 5,
                      btnWidth: MediaQuery.of(context).size.width * 0.3,
                      btnColor: kGreyBackColor,
                      fontSize: 8,
                      textColor: kGreenColor,
                      fontWeight: FontWeight.w500,
                      title: "More About teacher",
                    ),
                  ],
                ),
                Image.asset(
                  "assets/back_next.png",
                  height: 17.h,
                ),
                CustomButton(
                  btnHeight: 20,
                  btnRadius: 4,
                  textColor: kMainColor,
                  btnColor: kGreenColor,
                  btnWidth: MediaQuery.of(context).size.width * 0.15,
                  fontSize: 8,
                  title: "Enroll Now",
                )
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomText(
                    title: 'Posted on  Sep 5, 2022',
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    maxLines: 1,
                    color: kTextDateColor,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  CustomText(
                    title: widget.audio.shortDescription,
                    fontSize: 16,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w700,
                    maxLines: 1,
                    color: kBlackColor,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomText(
                    title:
                        'Lorem ipsum dolor sit amet consectetur. Faucibus tellus bibendum egestas dui facilisis vitae porttitor. Tristique est ipsum proin vestibulum lacus orci. Non ipsum sapien velit vitae magna quam. Cursus tempor nulla imperdiet tortor habitant arcu. Eu venenatis diam facilisis eu leo pellentesque quam ullamcorper malesuada. Facilisis diam mattis justo vel feugiat sagittis tortor urna. Arcu aliquam pellentesque lorem elit neque gravida. Bibendum bibendum feugiat facilisi viverra vitae tortor scelerisque facilisis orci.',
                    fontSize: 13,
                    lineHeight: 1.4,
                    fontWeight: FontWeight.w400,
                    color: kTextGreyColor,
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
