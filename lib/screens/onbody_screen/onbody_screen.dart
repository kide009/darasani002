import 'package:darasani/screens/auth/login_screen.dart';
import 'package:darasani/utilites/constants.dart';
import 'package:darasani/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../widgets/custom_button.dart';
import '../../utilites/helper.dart';
import 'on_body_two.dart';
import 'onbody_screen_one.dart';

class OnBodyScreen extends StatefulWidget {
  const OnBodyScreen({Key? key}) : super(key: key);

  @override
  State<OnBodyScreen> createState() => _OnBodyScreenState();
}

class _OnBodyScreenState extends State<OnBodyScreen> {
  PageController controller = PageController();
  int _curr = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/bg.png"), fit: BoxFit.fill)),
              child: Container(
                // height: MediaQuery.of(context).size.height * 0.6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: 550.h,
                      child: PageView(
                        controller: controller,
                        onPageChanged: (num) {
                          setState(() {
                            _curr = num;
                          });
                        },
                        children: const [
                          OnBodyOne(),
                          OnBodyTwo(),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SmoothPageIndicator(
                            controller: controller,
                            count: 2,
                            axisDirection: Axis.horizontal,
                            effect: ExpandingDotsEffect(
                              dotHeight: 9.h,
                              dotWidth: 9.h,
                              strokeWidth: 50.w,
                              activeDotColor: kSecondaryColor,
                              dotColor: kGreyLightColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 40.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            Helper.toRemoveUntiScreen(context, LogInScreen());
                          },
                          child: CustomText(
                            title: "Skip",
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            maxLines: 1,
                          ),
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        _curr == 1
                            ? CustomButton(
                                btnWidth:
                                    MediaQuery.of(context).size.width * 0.33,
                                btnRadius: 12,
                                btnHeight: 35.h,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                textColor: kMainColor,
                                btnColor: kSecondaryColor,
                                title: "Get started",
                                onPressed: () {
                                  Helper.toRemoveUntiScreen(
                                      context, LogInScreen());
                                },
                              )
                            : CustomButton(
                                btnWidth:
                                    MediaQuery.of(context).size.width * 0.33,
                                btnRadius: 12,
                                btnHeight: 35.h,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                textColor: kMainColor,
                                btnColor: kSecondaryColor,
                                title: "Next",
                                onPressed: () {
                                  controller.nextPage(
                                      duration: Duration(milliseconds: 400),
                                      curve: Curves.easeOut);
                                },
                              ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
