import 'package:darasani/controllers/LibraryController.dart';
import 'package:darasani/model/Library.dart';
import 'package:darasani/screens/home/ebook_summary_screen.dart';
import 'package:darasani/screens/home/student_profile_screen.dart';
import 'package:darasani/utilites/constants.dart';
import 'package:darasani/utilites/helper.dart';
import 'package:darasani/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utilites/config.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_button.dart';
import '../../widgets/custom_textfield.dart';

class EBookScreen extends StatefulWidget {
  const EBookScreen({Key? key}) : super(key: key);

  @override
  State<EBookScreen> createState() => _EBookScreenState();
}

class _EBookScreenState extends State<EBookScreen> {
  TextEditingController searchController = TextEditingController();

  LibraryController libraryController = Get.put(LibraryController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainColor,
        elevation: 0,
        automaticallyImplyLeading: false,
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
                  )
                ],
              ),
            ],
          )
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
                    libraryController.filterBookBySubject("Biology");
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
                    libraryController.filterBookBySubject("Physics");
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
                    libraryController.filterBookBySubject("History");
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
                    libraryController.filterBookBySubject("Maths");
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
                    libraryController.filterBookBySearch(searchQuery);
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
            Obx(() => GridView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 8,
                  childAspectRatio: 0.64),
              itemCount: libraryController.libraryList.value.length,
              itemBuilder: (context, index) {
                return EBookWidget(
                    library: libraryController.libraryList.value[index],
                    );
              },
            )),
          ],
        ),
      ),
    );
  }
}

class EBookWidget extends StatelessWidget {
  final library;

  const EBookWidget({super.key, this.library});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Helper.toScreen(context, EbookSummaryScreen(library: library,));
      },
      child: Card(
        elevation: 5,
        margin: EdgeInsets.zero,
        child: Container(
          decoration: BoxDecoration(
            color: kMainColor,
            borderRadius: BorderRadius.circular(5),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
          width: MediaQuery.of(context).size.width * 0.44,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                fit: StackFit.passthrough,
                children: [
                  Container(
                    height: 123.h,
                    child: Image.network(
                      library!.coverImg,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: CustomButton(
                      title: "ebook",
                      btnColor: kSecondaryColor,
                      textColor: kBlackColor,
                      btnWidth: 55,
                      btnHeight: 22,
                      btnRadius: 5,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomText(
                // title: live!.discription,
                title: library!.title,
                color: kBlackColor,
                fontSize: 9,
                fontWeight: FontWeight.w600,
                maxLines: 2,
              ),
              SizedBox(
                height: 15.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    title: library!.subject,
                    fontSize: 10,
                    color: kHinTextColor,
                    fontWeight: FontWeight.w400,
                  ),
                  CustomButton(
                    btnWidth: MediaQuery.of(context).size.width * 0.2,
                    title: "Read Now",
                    btnColor: kGreenDarkColor,
                    textColor: kMainColor,
                    fontSize: 10,
                    btnHeight: 25.h,
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
