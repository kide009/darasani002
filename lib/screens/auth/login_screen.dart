import 'package:darasani/screens/auth/forgot_password_screen.dart';
import 'package:darasani/screens/auth/sign_up_screen.dart';
import 'package:darasani/screens/bottom_bar/bottom_bar.dart';
import 'package:darasani/screens/home/home_screen.dart';
import 'package:darasani/utilites/constants.dart';
import 'package:darasani/utilites/helper.dart';
import 'package:darasani/widgets/custom_button.dart';
import 'package:darasani/widgets/custom_text.dart';
import 'package:darasani/widgets/custom_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utilites/validation_and_shared_preferences_utils.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../controllers/AuthController.dart';
import '../../widgets/login_button_widget.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController number = TextEditingController();
  bool isObsecure = true;
  UserController userController = UserController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  // bool isFirebaseInitialized = false;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   initializeFirebase();
  // }
  //
  // Future<void> initializeFirebase() async {
  //   await Firebase.initializeApp();
  //   setState(() {
  //     isFirebaseInitialized = true;
  //   });
  // }
  Future<String?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      final GoogleSignInAuthentication? googleSignInAuthentication = await googleSignInAccount?.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication?.accessToken,
        idToken: googleSignInAuthentication?.idToken,
      );

      final UserCredential authResult = await _auth.signInWithCredential(credential);

      final user = authResult.user;

      if(user != null){
       // print("${user.displayName ?? 'N/A'}, ${user.phoneNumber ?? 'N/A'}, ${user.email ?? 'N/A'}, ${user.uid ?? 'N/A'}");
        var login_result = await  userController.loginUser(user.email!, user.uid);
        if(login_result == "success"){
          Helper.toScreen(context, BottomBar());

        }
        else{
          var result = await  userController.registerUser(user.displayName!, user.phoneNumber ?? '0600000000', user.email!, user.uid!);

          if(result == "User has been created"){
            // String? authToken = await SharedPreferencesUtils.getAuthToken();
            Utils.showToast( result!, context: context);
            Helper.toScreen(context, BottomBar());
          }
          else{
            Utils.showToast('Registration failed or encountered an error.', context: context);
          }
          return result;
        }

      }

      //final User? user = authResult.user;
      return "";
    } catch (error) {
      return null;
    }
  }

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  Future<String?> signInWithFacebook1() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();

      if (result.status == LoginStatus.success) {
        final AccessToken accessToken = result.accessToken!;
        final AuthCredential credential = FacebookAuthProvider.credential(accessToken.token);

        final UserCredential authResult = await _auth.signInWithCredential(credential);
        final user = authResult.user;

        if(user != null){
          // print("${user.displayName ?? 'N/A'}, ${user.phoneNumber ?? 'N/A'}, ${user.email ?? 'N/A'}, ${user.uid ?? 'N/A'}");
          var login_result = await  userController.loginUser(user.email!, user.uid);
          if(login_result == "success"){
            Helper.toScreen(context, BottomBar());

          }
          else{
            var result = await  userController.registerUser(user.displayName!, user.phoneNumber ?? '0600000000', user.email!, user.uid!);

            if(result == "User has been created"){
              // String? authToken = await SharedPreferencesUtils.getAuthToken();
              Utils.showToast( result!, context: context);
              Helper.toScreen(context, BottomBar());
            }
            else{
              Utils.showToast('Registration failed or encountered an error.', context: context);
            }
            return result;
          }

        }
      } else {
        return null;
      }
    } catch (error) {
      print(error);
      return null;
    }
  }
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
                    height: 70.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      LoginButton(
                        title: "Google",
                        image: "assets/google.png",
                        onTap: (){
                        signInWithGoogle();

                        },
                      ),
                      LoginButton(
                        title: "Facebook",
                        image: "assets/fb.png",
                        onTap: (){
                          signInWithFacebook();
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 70.h,
                  ),
                  Text(
                    'Sign In',
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
                    height: 70.h,
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
                        GestureDetector(
                          onTap: () {
                            Helper.toScreen(context, ForgotPasswordScreen());
                          },
                          child: Container(
                            padding: EdgeInsets.all(5),
                            child: CustomText(
                              title: "Forgot password",
                              color: kSecondaryColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              maxLines: 1,
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 90.h,
                        ),
                        CustomButton(
                          btnHeight: 57.h,
                          title: "Sign In",
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          textColor: kMainColor,
                          btnColor: kSecondaryColor,
                          btnRadius: 10,
                          onPressed: () async{
                            //Helper.toScreen(context, BottomBar());
                            final emailText = email.text;
                            final passwordText = password.text;

                            if (!Utils.isValidEmail(emailText)) {
                            Utils.showToast('Invalid email address', context: context);
                            } else if (passwordText.length < 6) {
                            Utils.showToast('Password must be at least 6 characters long', context: context);
                            } else {
                            var result = await  userController.loginUser(emailText, passwordText);
                            if(result == "success"){
                              Helper.toScreen(context, BottomBar());

                            }
                            else{
                            Utils.showToast('Login failed or encountered an error.', context: context);
                            }
                          }
                          }),
                        SizedBox(
                          height: 30.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            Helper.toScreen(context, SignUpScreen());
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
                                  text: " Sign Up here ",
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



