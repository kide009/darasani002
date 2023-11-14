import 'package:darasani/controllers/MediaController.dart';
import 'package:darasani/screens/audio_book/audio_book_listening.dart';
import 'package:darasani/screens/audio_book/audio_book_summary_screen.dart';
import 'package:darasani/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utilites/constants.dart';
import '../../utilites/helper.dart';
import '../../widgets/audio_book_widget.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_text_button.dart';
import '../../widgets/custom_textfield.dart';
import '../home/student_profile_screen.dart';

class AudioBookScreen extends StatefulWidget {
  const AudioBookScreen({Key? key}) : super(key: key);

  @override
  State<AudioBookScreen> createState() => _AudioBookScreenState();
}

class _AudioBookScreenState extends State<AudioBookScreen> {
  MediaController audioController = Get.put(MediaController());
  TextEditingController searchController = TextEditingController();

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
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    audioController.filterAudioBySubject("Biology");
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
                    audioController.filterAudioBySubject("Physics");
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
                    audioController.filterAudioBySubject("History");
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
                    audioController.filterAudioBySubject("Maths");
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
                    audioController.filterAudioBySearch(searchQuery);
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
            CustomText(
              title: "Audio Books and Audio Classes",
              fontWeight: FontWeight.w700,
              fontSize: 16,
              textAlign: TextAlign.center,
              color: kBlackColor,
            ),
            SizedBox(
              height: 25.h,
            ),
            Expanded(
              child: Obx(() => ListView.builder(
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount: audioController.audioList.length,
                itemBuilder: (context, index) {
                  return  AudioBookWidget(audio:audioController.audioList[index]);
                },
              )),
            ),
          ],
        ),
      ),
    );
  }
}
