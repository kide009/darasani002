import 'package:darasani/model/Advertisement.dart';
import 'package:darasani/utilites/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/custom_text.dart';
import '../model/Teacher.dart';

class StudentWidget extends StatelessWidget {
  final advertisement;
  const StudentWidget({
    super.key,
    required this.advertisement
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      child: Column(
        children: [
          SizedBox(
            height: 10.h,
          ),
          Container(
            height: 60,
            width: 60,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                 advertisement!.coverImg,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          CustomText(
            title: advertisement.title,
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: kSecondaryColor,
          ),
          SizedBox(
            height: 10.h,
          ),
        ],
      ),
    );
  }


}
