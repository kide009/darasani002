import 'package:darasani/screens/auth/sign_up_screen.dart';
import 'package:darasani/utilites/constants.dart';
import 'package:darasani/utilites/helper.dart';
import 'package:darasani/widgets/custom_button.dart';
import 'package:darasani/widgets/custom_text.dart';
import 'package:darasani/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController email = TextEditingController();

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
                  ListTile(
                    leading: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          color: kBlackColor,
                        )),
                    title: Container(
                      margin: const EdgeInsets.only(right: 40),
                      child: Text(
                        'Forgot Password',
                        style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.w700,
                            color: kBlackColor,
                            fontSize: 20,
                          ),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
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
                            hintText: "Email",
                            hintTextColor: kBlackColor,
                            keyboardType: TextInputType.emailAddress,
                            hintFontSize: 14,
                            textFontSize: 14,
                            cursorColor: kBlackColor,
                            textColor: kBlackColor,
                          ),
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        CustomButton(
                          btnHeight: 57.h,
                          title: "Forgot Password",
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          textColor: kMainColor,
                          btnColor: kSecondaryColor,
                          btnRadius: 10,
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
