import 'dart:convert';
import 'dart:developer';
import 'package:darasani/model/Course.dart';
import 'package:darasani/model/Discussion.dart';
import 'package:darasani/model/Lesson.dart';
import 'package:darasani/model/Library.dart';
import 'package:dio/dio.dart';
import 'package:darasani/utilites/config.dart';
import '../../utilites/validation_and_shared_preferences_utils.dart';
import '../model/Advertisement.dart';
import '../model/Media.dart';
import '../model/Teacher.dart';

class RemoteServices {
  static var clientDio = Dio();

  static Future<List<Course>> fetchCourses() async {
    final String? authToken = await SharedPreferencesUtils.getAuthToken();
    var response = await clientDio.get(
        '$SERVER_URL/courses',
        options: Options( headers: {'Authorization': 'Bearer $authToken',},)
    );



    if (response.statusCode == 200) {
      List<dynamic> responseData = response.data;
      List<Course> courses = responseData.map((item) =>
          courseFromJson(json.encode(item))).toList();
      return courses;
    }else{
      return [];
    }
  }
  static Future<List<Lesson>> fetchCourseLessons() async {
    final String? authToken = await SharedPreferencesUtils.getAuthToken();
    var response = await clientDio.get(
        '$SERVER_URL/courses',
        options: Options( headers: {'Authorization': 'Bearer $authToken',},)
    );


    if (response.statusCode == 200) {
      List<dynamic> responseData = response.data;
      List<Lesson> courses = responseData.map((item) =>
          lessonFromJson(json.encode(item))).toList();
      return courses;
    }else{
      return [];
    }
  }
  static Future<List<Advertisement>> fetchAdvertisements(type) async {
    final String? authToken = await SharedPreferencesUtils.getAuthToken();
    var response = await clientDio.get(
        '$SERVER_URL/advertisement?type=$type',
        options: Options( headers: {'Authorization': 'Bearer $authToken',},)
    );

    var statusCode = response.statusCode;
    print("The present omyseazon $statusCode");

    if (response.statusCode == 200) {
      List<dynamic> responseData = response.data;
      List<Advertisement> items = responseData.map((item) =>
          advertisementFromJson(json.encode(item))).toList();
      return items;
    }else{
      return [];
    }
  }
  static Future<List<Teacher>> fetchTeachers(role) async {
    final String? authToken = await SharedPreferencesUtils.getAuthToken();
    var headers = {
      'Authorization': 'Bearer $authToken'
    };

    var response = await clientDio.get(
        '$SERVER_URL/users/?role=$role',
        options: Options(
          method: 'GET',
          headers: headers,)

    );
    if (response.statusCode == 200) {
      List<dynamic> responseData = response.data;
      List<Teacher> teachers = responseData.map((item) =>
          teacherFromJson(json.encode(item))).toList();
      return teachers;
    }else{
      return [];
    }
    }

    static Future<List<Library>>   fetchLibraries() async{
      final String? authToken = await SharedPreferencesUtils.getAuthToken();

      var headers = {
        'Authorization': 'Bearer $authToken'
      };

      var response =  await clientDio.get(
        '$SERVER_URL/e-library/?type=EBOOK',
        options: Options(
          method: 'GET',
          headers: headers,        )
      );
      if(response.statusCode == 200){
        List<dynamic> responseData = response.data;
        List<Library> libraries = responseData.map((item) =>
          libraryFromJson(json.encode(item))).toList();
        return libraries;
       }else{
        return [];
      }
  }


  static Future<List<Discussion>>   fetchDiscussions() async{
    final String? authToken = await SharedPreferencesUtils.getAuthToken();

    var headers = {
      'Authorization': 'Bearer $authToken'
    };

    var response =  await clientDio.get(
        '$SERVER_URL/e-library/?type=AUDIO_BOOK',
        options: Options(
          method: 'GET',
          headers: headers,        )
    );
    if(response.statusCode == 200){
      List<dynamic> responseData = response.data;
      List<Discussion> discussions = responseData.map((item) =>
          discussionFromJson(json.encode(item))).toList();
      return discussions;
    }else{
      return [];
    }
  }

  static Future<List<Media>> fetchMedia(mediaType) async {
    final String? authToken = await SharedPreferencesUtils.getAuthToken();

    var headers = {
      'Authorization': 'Bearer $authToken'
    };

    var response =  await clientDio.get(
        '$SERVER_URL/e-library/?type=$mediaType',
        options: Options(
          method: 'GET',
          headers: headers,        )
    );
    if (response.statusCode == 200) {
      List<dynamic> responseData = response.data;
      List<Media> mediaList = responseData
          .map((item) => mediaFromJson(json.encode(item)))
          .toList();
      return mediaList;
    } else {
      return [];
    }
  }


}