import 'package:darasani/model/Lesson.dart';
import 'package:get/get.dart';
import 'package:darasani/model/Course.dart';
import 'package:darasani/controllers/CourseController.dart';

import '../services/RemoteServices.dart';

class CourseController extends GetxController{

  var courseList = <Course>[].obs;
  var lessonList = <Lesson>[].obs;
  void fetchCourses()async{
    var courses = await RemoteServices.fetchCourses();

    if(courses.isNotEmpty) {
      courseList.value = courses;
    }
  }
  void fetchCourseLessons()async{
    var courses = await RemoteServices.fetchCourseLessons();

    if(courses.isNotEmpty) {
      lessonList.value = courses;
    }
  }
  void filterCoursesBySubject(selectedSubject)async{
    var courses = await RemoteServices.fetchCourses();
    final filteredCourses = courses.where((course) => course.subject == selectedSubject).toList();

    //print(filteredCourses.length);
    //if(filteredCourses.isNotEmpty) {
      courseList.value = filteredCourses;
    //}
    update();
  }

  void filterCoursesBySearch(searchQuery)async{
  var courses = await RemoteServices.fetchCourses();
  courseList.clear();
   courses.forEach((course) {
    final titleMatch = course.title.toLowerCase().contains(searchQuery.toLowerCase());
    final descriptionMatch = course.description.toLowerCase().contains(searchQuery.toLowerCase());
    final priceMatch = course.price.toString().contains(searchQuery);
    final subject = course.subject.toLowerCase().contains(searchQuery);

    if (titleMatch || descriptionMatch || priceMatch || subject) {
      courseList.add(course);
    }
  });

  //if(filteredCourses.isNotEmpty) {
  //courseList.value = filteredCourses;
  //}
  update();
}
}