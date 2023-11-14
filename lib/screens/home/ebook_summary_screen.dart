import 'package:darasani/screens/home/ebook_reader_screen.dart';
import 'package:darasani/screens/home/student_profile_screen.dart';
import 'package:darasani/utilites/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../utilites/config.dart';
import '../../utilites/constants.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/image_title_widget.dart';
import 'on_demand_classes_lesson_screen.dart';

class EbookSummaryScreen extends StatefulWidget {
  final library;
  const EbookSummaryScreen({Key? key,this.library}) : super(key: key);

  @override
  State<EbookSummaryScreen> createState() => _EbookSummaryScreenState();
}

class _EbookSummaryScreenState extends State<EbookSummaryScreen> {
  @override
  Widget build(BuildContext context) {
    final DateFormat dateFormat = DateFormat('d MMM y');

    return Scaffold(
      backgroundColor: kGreyColor,
      appBar: AppBar(
        backgroundColor: kMainColor,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
         // child: Center(
          //  child: Image.network(
          //    widget.library.coverImg,
          //    height: 14.h,
          //  ),
         // ),
        ),
        centerTitle: true,
        title: CustomText(
          title: "Ebooks",
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
                  ),
                ],
              ),
            ],
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 212.h,
              width: MediaQuery.of(context).size.width,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  widget.library.coverImg,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
              child: ListView(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      Container(
                        width: MediaQuery.of(context).size.width * 0.24,
                        child: CustomText(
                          title: widget.library.publisher.name,
                          fontSize: 12,
                          maxLines: 1,
                          fontWeight: FontWeight.w500,
                          color: kBlackColor,
                        ),
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                     // CustomText(
                      //  title: "Form  III",
                      //  fontSize: 12,
                      //  maxLines: 1,
                      //  fontWeight: FontWeight.w400,
                      //  color: kHinTextColor,
                     // ),
                      const SizedBox(
                        width: 2,
                      ),
                      CustomText(
                        title: widget.library.subject,
                        fontSize: 12,
                        maxLines: 1,
                        fontWeight: FontWeight.w400,
                        color: kHinTextColor,
                      ),
                      Image.asset(
                        "assets/back_next.png",
                        height: 17.h,
                      ),
                      CustomButton(
                        btnHeight: 20,
                        btnRadius: 4,
                        btnColor: kGreenColor,
                        btnWidth: MediaQuery.of(context).size.width * 0.15,
                        fontSize: 8,
                        onPressed: () {
                          Helper.toScreen(context, EbookReaderScreen(content:widget.library.fileUrl));
                        },
                        textColor: kMainColor,
                        title: "Read Now",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    children: [
                      CustomText(
                        title: "Posted on ",
                        color: kHinTextColor,
                        fontSize: 12,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      CustomText(
                        title: dateFormat.format(widget.library.updatedAt),
                        color: kHinTextColor,
                        fontSize: 12,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomText(
                    title: widget.library.title,
                    color: kBlackColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomText(
                    title:
                        widget.library.description,
                    color: kGreyDarkColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    lineHeight: 1.4,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
