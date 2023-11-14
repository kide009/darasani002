import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utilites/config.dart';
import '../../utilites/constants.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text.dart';
import '../home/on_demand_classes_lesson_screen.dart';

class AudioBookListening extends StatefulWidget {
  final attachment;
  final description;
  const AudioBookListening({super.key,this.attachment,this.description}) ;

  @override
  State<AudioBookListening> createState() => _AudioBookListeningState();
}

class _AudioBookListeningState extends State<AudioBookListening> {
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;

  Duration duration = Duration();
  Duration position = Duration();

  void initState() {
    // TODO: implement initState
    super.initState();
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.PLAYING;
      });
    });
    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });
    audioPlayer.onAudioPositionChanged.listen((newPostion) {
      setState(() {
        position = newPostion;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    audioPlayer.dispose();
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
                      // Helper.toScreen(context, StudentProfileScreen());
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
        child: ListView(
          children: [
            SizedBox(
              height: 15.h,
            ),
            CustomText(
              title: widget.description,
              fontSize: 13,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w700,
              color: kBlackColor,
            ),
            SizedBox(
              height: 15.h,
            ),
            Column(
              children: [
                Container(
                  height: 136.h,
                  width: 113.w,
                  child: Image.asset(
                    "assets/_ebook thumb.png",
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      title: "Physics  :",
                      color: kDarkGreyTextColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 8,
                      maxLines: 1,
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    CustomText(
                      title: "Form II",
                      color: kDarkGreyTextColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 8,
                      maxLines: 1,
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    CustomText(
                      title: "30  Minutes",
                      color: kDarkGreyTextColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 8,
                      maxLines: 1,
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    Container(
                      width: 45,
                      child: CustomButton(
                        btnHeight: 20,
                        btnRadius: 4,
                        btnColor: kGreyLightColor,
                        textColor: kBlackColor,
                        fontSize: 8,
                        title: "E-book",
                      ),
                    )
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
                    SizedBox(
                      width: 5.w,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.24,
                      child: CustomText(
                        title: "Isaac Tan",
                        fontSize: 12,
                        maxLines: 1,
                        fontWeight: FontWeight.w400,
                        color: kBlackColor,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/Vector (11).png",
                            height: 15.h,
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          CustomText(
                            title: "Form  III",
                            fontSize: 10,
                            maxLines: 1,
                            fontWeight: FontWeight.w400,
                            color: kGreyDarkColor,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/fi_book-open.png",
                            height: 15.h,
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          CustomText(
                            title: "Form  III",
                            fontSize: 10,
                            maxLines: 1,
                            fontWeight: FontWeight.w400,
                            color: kGreyDarkColor,
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      "assets/Sound symbo.png",
                      height: 20.h,
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 25.h,
            ),
            CustomText(
              title: "The topic Playing",
              fontSize: 16,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w700,
              color: kBlackColor,
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              height: 60.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage(
                        "assets/Gothica.png",
                      ),
                      fit: BoxFit.cover)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    "assets/Vector (19).png",
                    height: 25.h,
                  ),
                  InkWell(
                    onTap: () async {
                      if (isPlaying) {
                        await audioPlayer.pause();
                      } else {
                        await audioPlayer.play(SERVER_URL+'/'+widget.attachment!);
                      }
                      setState(() {
                        isPlaying = true;
                      });
                    },
                    child: Icon(
                      isPlaying ? Icons.pause : Icons.play_arrow,
                      size: 50,
                      color: kSecondaryColor,
                    ),
                  ),
                  // Image.asset(
                  //   "assets/Vector (20).png",
                  //   height: 25.h,
                  // ),
                  Image.asset(
                    "assets/Vector (21).png",
                    height: 25.h,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
          ],
        ),
      ),
    );
  }

  stopPlay() {
    audioPlayer.stop();
  }

  seekToNext(int sec) {
    if (sec < duration.inSeconds && sec > 0) {
      Duration newPos = Duration(seconds: sec);
      audioPlayer.seek(newPos);
    }
  }

  nexttoSec(int sec) {
    Duration newPos = Duration(seconds: sec);
  }

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return [
      if (duration.inHours > 0) hours,
      minutes,
      seconds,
    ].join(':');
  }
}
