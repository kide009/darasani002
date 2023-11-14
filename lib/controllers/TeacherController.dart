import 'package:darasani/model/Teacher.dart';
import 'package:darasani/services/RemoteServices.dart';
import 'package:get/get.dart';

class TeacherController extends GetxController{

  var teacherList = <Teacher>[].obs;

  void fetchTeachers()async{
    var teachers = await RemoteServices.fetchTeachers('INSTRUCTOR');
      if(teachers.isNotEmpty) {
        teacherList.value = teachers;
      }
  }

}

