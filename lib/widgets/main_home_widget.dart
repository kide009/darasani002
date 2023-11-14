import 'package:darasani/model/Advertisement.dart';
import 'package:darasani/utilites/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../widgets/custom_text.dart';

class MainHomeWidget extends StatelessWidget {
  MainHomeWidget({
    this.index,
    this.advertisement
  });

  int? index;
  Advertisement? advertisement;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 179.h,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              advertisement!.coverImg ?? "",
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: 179.h,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomText(
                title: advertisement!.title ?? "",
                fontWeight: FontWeight.w600,
                color: kMainColor,
                fontSize: 20,
                maxLines: 1,
              ),
              SizedBox(
                height: 5.h,
              ),
              CustomText(
                title:advertisement!.description ?? "",
                fontWeight: FontWeight.w400,
                color: kMainColor,
                fontSize: 12,
                maxLines: 3,
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                // height: 179.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: AnimatedSmoothIndicator(
                        activeIndex: index ?? 0,
                        count: 4,
                        effect: const WormEffect(
                            dotHeight: 10,
                            dotWidth: 10,
                            dotColor: kMainColor,
                            activeDotColor:
                                kBlueColor), // your preferred effect
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
