import 'package:darasani/screens/auth/login_screen.dart';
import 'package:darasani/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import SharedPreferences

import '../../controllers/AuthController.dart';
import '../../utilites/constants.dart';
import '../../utilites/helper.dart';
import '../../widgets/profile_widget.dart';

class StudentProfileScreen extends StatefulWidget {
  const StudentProfileScreen({Key? key}) : super(key: key);

  @override
  State<StudentProfileScreen> createState() => _StudentProfileScreenState();
}

class _StudentProfileScreenState extends State<StudentProfileScreen> {
  String? name;
  String? email;
  String? phoneNumber;
  String? profileImg;


  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  Future<void> loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    UserController userController = UserController();
    // Retrieve 'name', 'email', and 'phoneNumber' from SharedPreferences
    setState(() {
      email = prefs.getString('email');
      userController.fetchUserByEmail(email!);

       name = prefs.getString('name');
      profileImg = prefs.getString('profileImg');
       phoneNumber = prefs.getString('phoneNumber');


    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        backgroundColor: kMainColor,
        elevation: 0,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListTile(
              leading: Container(
                margin: const EdgeInsets.only(right: 10),
                height: 49.h,
                width: 49.w,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: profileImg != null
                      ? Image.network(
                    profileImg!,
                    fit: BoxFit.cover,
                  )
                      : Image.asset(
                    "assets/dp.png",
                    fit: BoxFit.cover,
                  ),
                ),

              ),
              title: CustomText(
                title: "Hello",
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: kGreyDarkColor,
              ),
              minLeadingWidth: -4,
              subtitle: CustomText(
                title: name,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: kBlackColor,
              ),
            ),
            const Divider(
              color: kGreyLightColor,
            ),
            ProfileWidget(
              title: "My one to one  Bookings",
              image: "assets/Filter.png",
              height: 16,
            ),
            // ProfileWidget(
            //   title: "My Live Classes",
            //   image: "assets/Video Call.png",
            //   height: 25.h,
            // ),
            ProfileWidget(
              title: "Get Help",
              image: "assets/ion_mail-outline.png",
              height: 20.h,
            ),
            ProfileWidget(
              title: "My E-book",
              image: "assets/Vector (13).png",
              height: 15.h,
            ),

            GestureDetector(
              onTap: () async {
                final prefs = await SharedPreferences.getInstance();
                await prefs.remove('auth_token'); // Clear the saved token

                Helper.toScreen(context, LogInScreen());
              },
               child: Container(
                 margin: EdgeInsets.only(left: 33.0), // Add margin to the left
                 child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.exit_to_app,
                      size: 18.0,
                    ),
                    SizedBox(width: 8.0),
                    Container(
                      margin: EdgeInsets.only(left: 18.0),
                      child: Text(
                        "Logout",
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
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
