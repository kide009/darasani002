import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../utilites/config.dart';
import 'package:dio/dio.dart';

import '../utilites/validation_and_shared_preferences_utils.dart';
class UserController extends GetxController {
  // final storage = FlutterSecureStorage();
  static var clientDio = Dio();

  Future<String?> registerUser(String name, String phoneNumber, String email,
      String password) async {
    try {
      var headers = {
        'Content-Type': 'application/json',
      };
      var response = await clientDio.request(
        '$SERVER_URL/auth/signup',
        options: Options(
          method: 'POST',
          headers: headers,
        ),
        data: {
          'name': name,
          'email': email,
          'phoneNumber': phoneNumber,
          'password': password,
          'role': 'STUDENT'
        },
      );

      if (response.statusCode == 201) {
        final Map<String, dynamic> responseData = response.data;
        final String? authToken = responseData['access_token'];

        await saveTokenToSharedPreferences(authToken);
        final prefs = await SharedPreferences.getInstance();

        prefs.setString('name', name);
        prefs.setString('email', email);
        prefs.setString('phoneNumber', phoneNumber);
        return 'User has been created';
      } else {
        final Map<String, dynamic> errorData = response.data;
        final String errorMessage = errorData['message'];
        return errorMessage;
      }
    } catch (e) {
      return 'An error occurred during registration. ';
    }
  }

  Future<void> saveTokenToSharedPreferences(String? token) async {
    if (token != null) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('auth_token', token);
    }
  }


  Future<String?> loginUser(String email, String password) async {
    try {
      var headers = {
        'Content-Type': 'application/json',
      };
      var response = await clientDio.request(
        '$SERVER_URL/auth/signin',
        options: Options(
          method: 'POST',
          headers: headers,
        ),
        data: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data;
        final String? authToken = responseData['access_token'];

        await saveTokenToSharedPreferences(authToken);
        final prefs = await SharedPreferences.getInstance();

        prefs.setString('email', email);
        return 'success';
      } else {
        final Map<String, dynamic> errorData = response.data;
        final String errorMessage = errorData['message'];
        return errorMessage;
      }
    } catch (e) {
      print(e);

      return 'An error occurred during login. ';
    }
  }

  // Modify the loadUsers method to fetch users and return a user by email
  Future<Map<String, dynamic>?> fetchUserByEmail(String email) async {
    try {
      final users = await loadUsers(); // Load all users from the API

      for (final user in users) {
        final userJsonEmail = user['email'] as String;
        if (userJsonEmail == email) {
          final prefs = await SharedPreferences.getInstance();

          prefs.setString('name', user['name'] as String);
          prefs.setString('email', user['email'] as String);
          prefs.setString('phoneNumber', user['phoneNumber'] as String);
          prefs.setString('profileImg', user['profileImg'] as String);


          return user;
        }
      }

      return null; // User not found
    } catch (e) {
      print('Error fetching user by email: $e');
      return null; // Handle error as needed
    }
  }


  // Method to load users from the API
  Future<List<Map<String, dynamic>>> loadUsers() async {
    try {
      final String? authToken = await SharedPreferencesUtils.getAuthToken();
      var response = await clientDio.get(
          '$SERVER_URL/users',
          options: Options( headers: {'Authorization': 'Bearer $authToken',},)
      );
     // final response = await clientDio.get('$SERVER_URL/users');
      if (response.statusCode == 200) {
        final List<dynamic> userJsonList = response.data as List;
        final List<Map<String, dynamic>> users = userJsonList.cast<Map<String, dynamic>>();
        return users;
      } else {
        return []; // Handle error as needed
      }
    } catch (e) {
      print('Error loading users: $e');
      return []; // Handle error as needed
    }
  }

}