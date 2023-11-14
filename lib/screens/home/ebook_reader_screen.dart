import 'package:darasani/controllers/LibraryController.dart';
import 'package:darasani/screens/home/profile_screen.dart';
import 'package:darasani/screens/home/student_profile_screen.dart';
import 'package:darasani/utilites/config.dart';
import 'package:darasani/utilites/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import '../../utilites/constants.dart';
import '../../widgets/custom_text.dart';

class EbookReaderScreen extends StatefulWidget {
  final content;
  const EbookReaderScreen({Key? key,this.content}) : super(key: key);

  @override
  State<EbookReaderScreen> createState() => _EbookReaderScreenState();
}

class _EbookReaderScreenState extends State<EbookReaderScreen> {
  LibraryController  libraryCOntroller = Get.put(LibraryController());
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
        child: SfPdfViewer.network(
            widget.content,
            scrollDirection: PdfScrollDirection.vertical),
      ),
    );
  }
}
