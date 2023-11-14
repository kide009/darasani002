import 'package:get/get.dart';
import 'package:darasani/controllers/CourseController.dart';

import '../model/Advertisement.dart';
import '../services/RemoteServices.dart';

class HomeController extends GetxController{

  var AdvertisementList = <Advertisement>[].obs;
  var AdvertisementStudentList = <Advertisement>[].obs;

  void fetchAdvertisements()async{
    var Advertisements = await RemoteServices.fetchAdvertisements("normal");

    if(Advertisements.isNotEmpty) {
      AdvertisementList.value = Advertisements;
    }
  }

  void fetchStudentAdvertisements()async{
    var Advertisements = await RemoteServices.fetchAdvertisements("student");

    if(Advertisements.isNotEmpty) {
      AdvertisementStudentList.value = Advertisements;
    }
    print("students" + AdvertisementStudentList.length.toString());
  }
}