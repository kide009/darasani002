import 'package:another_flushbar/flushbar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class Utils {
  static bool isValidPhoneNumber(String phoneNumber) {
    final cleanPhoneNumber = phoneNumber.replaceAll(RegExp(r'[^\d]'), '');
    final validLengths = [10, 12];
    return validLengths.contains(cleanPhoneNumber.length) && cleanPhoneNumber.contains(RegExp(r'^[0-9]+$'));
  }

  static bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    return emailRegex.hasMatch(email);
  }

  static void showToast(String message, {required BuildContext context}) {
    Flushbar(
      message: message,
      duration: Duration(seconds: 5),
    )..show(context);
  }

}

class SharedPreferencesUtils {
  static Future<String?> getAuthToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }
}
