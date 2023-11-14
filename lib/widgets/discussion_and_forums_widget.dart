import 'package:darasani/utilites/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../model/live_class_model.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text.dart';
import '../model/Discussion.dart';

class DiscussionsAndForums extends StatefulWidget {
  final  discussion;
  const DiscussionsAndForums({Key? key,this.discussion}) : super(key: key);

  @override
  State<DiscussionsAndForums> createState() => _DiscussionsAndForumsState();
}

class _DiscussionsAndForumsState extends State<DiscussionsAndForums> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.only(bottom: 5),
      child: Container(
        decoration: BoxDecoration(
          color: kMainColor,
          borderRadius: BorderRadius.circular(5),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        width: MediaQuery.of(context).size.width * 0.55,
        child: Column(
          children: [
            ListTile(
              visualDensity: VisualDensity(vertical: -4),
              contentPadding: EdgeInsets.zero,
              leading: Container(
                height: 34.h,
                width: 34.w,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    "assets/Ellipse 69.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: CustomText(
                title: widget.discussion.title,
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Container(
              height: 59.h,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                "assets/_discussion thumb.png",
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            CustomText(
              title:
                  widget.discussion.content,
              fontWeight: FontWeight.w600,
              fontSize: 10,
            ),
            SizedBox(
              height: 15.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Image.asset(
                      "assets/u_comment-alt-dots.png",
                      height: 15.h,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    CustomText(
                      title: "6 comments",
                      fontSize: 8,
                      color: kBlackColor,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Image.asset(
                      "assets/timer (1).png",
                      height: 15.h,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    CustomText(
                      title: "6 weeks",
                      fontSize: 8,
                      color: kBlackColor,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Image.asset(
                      "assets/fi_book-open.png",
                      height: 15.h,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    CustomText(
                      title: "Biology",
                      fontSize: 8,
                      color: kBlackColor,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Image.asset(
                      "assets/Vector (11).png",
                      height: 15.h,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    CustomText(
                      title: "Biology",
                      fontSize: 8,
                      color: kBlackColor,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
