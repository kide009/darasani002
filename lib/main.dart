import 'package:darasani/provider/main_provider.dart';
import 'package:darasani/screens/audio_book/audio_book_listening.dart';
import 'package:darasani/screens/audio_book/audio_book_screen.dart';
import 'package:darasani/screens/audio_book/audio_book_summary_screen.dart';
import 'package:darasani/screens/auth/forgot_password_screen.dart'
import 'package:darasani/screens/auth/login_screen.dart';
import 'package:darasani/screens/auth/sign_up_screen.dart';
import 'package:darasani/screens/bottom_bar/bottom_bar.dart';
import 'package:darasani/screens/home/ebook_reader_screen.dart';
import 'package:darasani/screens/home/ebook_summary_screen.dart';
import 'package:darasani/screens/home/ebooks_screen.dart';
import 'package:darasani/screens/home/home_screen.dart';
import 'package:darasani/screens/home/home_teacher_screen.dart';
import 'package:darasani/screens/home/on_demand_classes_lesson_screen.dart';
import 'package:darasani/screens/home/on_demand_classes_screen.dart';
import 'package:darasani/screens/home/profile_screen.dart';
import 'package:darasani/screens/home/student_profile_screen.dart';
import 'package:darasani/screens/splash_screen/splash_screen.dart';
import 'package:darasani/utilites/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

Future<void> main() async {

  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  WidgetsFlutterBinding.ensureInitialized(); // Ensure that plugins are initialized.
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return ChangeNotifierProvider<MainProvider>(
          create: (context) => MainProvider(),
          builder: (context, child) => GetMaterialApp(
            title: "darasani",
            theme: ThemeData(
              splashColor: kMainColor,
              // accentColor: kMainColor,
              scaffoldBackgroundColor: kMainColor,
              fontFamily: "Inter",
              primaryColor: kMainColor,
            ),
            debugShowMaterialGrid: false,
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
          ),
        );
      },
      designSize: const Size(390, 818),
    );
  }
}
