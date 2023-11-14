import 'package:darasani/utilites/constants.dart';
import 'package:darasani/utilites/helper.dart';
import 'package:darasani/widgets/custom_button.dart';
import 'package:darasani/widgets/custom_text.dart';
import 'package:darasani/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utilites/validation_and_shared_preferences_utils.dart';

import '../../controllers/AuthController.dart';
import '../../widgets/login_button_widget.dart';
import '../bottom_bar/bottom_bar.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  bool isObsecure = true;

  UserController userController = UserController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/log_in_bg.png"),
                    fit: BoxFit.fill),
              ),
              child: ListView(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomText(
                    title: "Join us to start Learning",
                    fontSize: 24,
                    fontFamily: "Rubik",
                    color: kBlackColor,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      LoginButton(
                        title: "Google",
                        image: "assets/google.png",
                      ),
                      LoginButton(
                        title: "Facebook",
                        image: "assets/fb.png",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 42.h,
                  ),
                  Text(
                    'Sign Up',
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.w700,
                        color: kSecondaryColor,
                        fontSize: 36,
                      ),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 25.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: kTextFieldColor.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: CustomTextField(
                              prefixIcon: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/email.png",
                                    height: 15.h,
                                  ),
                                ],
                              ),
                            hintText: "Full Name",
                            hintTextColor: kBlackColor,
                            hintFontSize: 14,
                            textFontSize: 14,
                            cursorColor: kBlackColor,
                            textColor: kBlackColor,
                            controller:name
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: kTextFieldColor.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: CustomTextField(
                              prefixIcon: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/email.png",
                                    height: 15.h,
                                  ),
                                ],
                              ),
                            hintText: "Phone Number",
                            hintTextColor: kBlackColor,
                            keyboardType: TextInputType.number,
                            hintFontSize: 14,
                            textFontSize: 14,
                            cursorColor: kBlackColor,
                            textColor: kBlackColor,
                            controller:phoneNumber
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: kTextFieldColor.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: CustomTextField(
                            prefixIcon: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/email.png",
                                  height: 15.h,
                                ),
                              ],
                            ),
                            hintText: "Email",
                            hintTextColor: kBlackColor,
                            keyboardType: TextInputType.emailAddress,
                            hintFontSize: 14,
                            textFontSize: 14,
                            cursorColor: kBlackColor,
                            textColor: kBlackColor,
                            controller: email,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: kTextFieldColor.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: CustomTextField(
                            prefixIcon: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/lock.png",
                                  height: 15.h,
                                ),
                              ],
                            ),
                            hintText: "**********",
                            hintTextColor: kBlackColor,
                            keyboardType: TextInputType.emailAddress,
                            hintFontSize: 14,
                            textFontSize: 14,
                            cursorColor: kBlackColor,
                            obscureText: isObsecure,
                            textColor: kBlackColor,
                            controller: password,
                            suffixIcon: IconButton(
                              onPressed: () => setState(() {
                                isObsecure = !isObsecure;
                              }),
                              icon: isObsecure == false
                                  ? const Icon(
                                      Icons.visibility,
                                      color: kGreyLightColor,
                                    )
                                  : const Icon(
                                      Icons.visibility_off,
                                      color: kGreyLightColor,
                                    ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        CustomButton(
                          btnHeight: 57.h,
                          title: "Sign Up",
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          onPressed: () async {
                            final nameText = name.text;
                            final phoneNumberText = phoneNumber.text;
                            final emailText = email.text;
                            final passwordText = password.text;

                            if (nameText.isEmpty) {
                              Utils.showToast('Name is required', context: context);
                            } else if (!Utils.isValidPhoneNumber(phoneNumberText)) {
                              Utils.showToast('Invalid phone number', context: context);
                            } else if (!Utils.isValidEmail(emailText)) {
                              Utils.showToast('Invalid email address', context: context);
                            } else if (passwordText.length < 6) {
                              Utils.showToast('Password must be at least 6 characters long', context: context);
                            } else {
                            var result = await  userController.registerUser(nameText, phoneNumberText, emailText, passwordText);

                            if(result == "User has been created"){
                             // String? authToken = await SharedPreferencesUtils.getAuthToken();
                              Utils.showToast( result!, context: context);
                              Helper.toScreen(context, BottomBar());
                            }
                            else{
                              Utils.showToast('Registration failed or encountered an error.', context: context);
                            }
                            }
                            // Helper.toScreen(context, BottomBar());
                           // userController.registerUser(name.text, phoneNumber.text, email.text, password.text);


                          },
                          textColor: kMainColor,
                          btnColor: kSecondaryColor,
                          btnRadius: 10,
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: "Do you have an account? ",
                                  style: TextStyle(
                                    color: kBlackColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                  ),
                                ),
                                TextSpan(
                                  text: " Login here ",
                                  style: TextStyle(
                                    color: kSecondaryColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
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
