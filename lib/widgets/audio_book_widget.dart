import 'package:darasani/screens/audio_book/audio_book_listening.dart';
import 'package:darasani/screens/audio_book/audio_book_summary_screen.dart';
import 'package:darasani/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utilites/constants.dart';
import '../../utilites/helper.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_text_button.dart';
import '../../widgets/custom_textfield.dart';

class AudioBookWidget extends StatelessWidget {
  final audio;
  const AudioBookWidget({
    super.key,
    this.audio
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Helper.toScreen(context, AudioBookSummaryScreen(audio:audio));
      },
      child: Card(
        margin: EdgeInsets.only(bottom: 15),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 70.h,
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(13),
                      child: Image.asset(
                        audio!.coverImg,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.61,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          title: audio.shortDescription,
                          color: kDarkBlueColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          maxLines: 1,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        CustomText(
                          title:
                             audio.shortDescription,
                          color: kBlackColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 10,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        title: audio.title,
                        color: kDarkGreyTextColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 8,
                        maxLines: 1,
                      ),
                      CustomText(
                        title: audio.subject,
                        color: kDarkGreyTextColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 8,
                        maxLines: 1,
                      ),
                      CustomText(
                        title: "30  Minutes",
                        color: kDarkGreyTextColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 8,
                        maxLines: 1,
                      ),
                      Image.asset(
                        "assets/Sound symbo.png",
                        height: 15.h,
                      ),
                      Container(
                        width: 45,
                        child: CustomButton(
                          onPressed: () {
                            Helper.toScreen(context, AudioBookListening(attachment:audio.fileUrl));
                          },
                          btnHeight: 20,
                          btnRadius: 4,
                          btnColor: kGreenColor,
                          textColor: kMainColor,
                          fontSize: 8,
                          title: "Listen Now",
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
