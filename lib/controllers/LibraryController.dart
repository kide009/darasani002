import 'package:get/get.dart';
import '../model/Library.dart';
import '../services/RemoteServices.dart';

class LibraryController extends GetxController{

  var libraryList = <Library>[].obs;
  void fetchLibraries()async{
    var libraries = await RemoteServices.fetchLibraries();
    if(libraries.isNotEmpty) {
      libraryList.value = libraries;
    }
  }


  void filterBookBySubject(selectedSubject) async {
    var libraries = await RemoteServices.fetchLibraries();
    final filteredCourses = libraries.where((course) =>
    course.subject == selectedSubject).toList();

    //print(filteredCourses.length);
    //if(filteredCourses.isNotEmpty) {
    libraryList.value = filteredCourses;
    //}
    update();
  }

  void filterBookBySearch(searchQuery) async {
    var libraries = await RemoteServices.fetchLibraries();
    libraryList.clear();
    libraries.forEach((v) {
      final titleMatch = v.title.toLowerCase().contains(
          searchQuery.toLowerCase());
      final descriptionMatch = v.description.toLowerCase().contains(
          searchQuery.toLowerCase());
      final priceMatch = v.subject.toLowerCase().contains(searchQuery);

      if (titleMatch || descriptionMatch || priceMatch) {
        libraryList.add(v);
      }
    });
  }



}
