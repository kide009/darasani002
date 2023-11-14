import 'package:darasani/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utilites/validation_and_shared_preferences_utils.dart';

import '../../utilites/helper.dart';
import '../bottom_bar/bottom_bar.dart';
import '../home/home_screen.dart';
import '../onbody_screen/onbody_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    checkAuthTokenAndNavigate();
  }

  Future<void> checkAuthTokenAndNavigate() async {
    final String? authToken = await SharedPreferencesUtils.getAuthToken();

    if (authToken != null) {
      Future.delayed(Duration(seconds: 5), () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => BottomBar()));
      });
    } else {
      // Token is not available, navigate to OnBodyScreen after a delay
      Future.delayed(Duration(seconds: 5), () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => OnBodyScreen()));
      });
    }
  }


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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/splash_icon.png",
                    height: 180.h,
                  ),
                  Column(
                    children: [
                      Image.asset(
                        "assets/Darasani APP.png",
                        height: 90.h,
                        width: 250,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 70.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
