import 'package:darasani/utilites/constants.dart';
import 'package:darasani/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class LiveClasses extends StatefulWidget {
  const LiveClasses({Key? key}) : super(key: key);

  @override
  State<LiveClasses> createState() => _LiveClassesState();
}

class _LiveClassesState extends State<LiveClasses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: CustomText(
                title: "VIDEO-CLASS",
                fontWeight: FontWeight.w700,
                fontSize: 40,
                color: kBlackColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
