import 'package:get/get.dart';
import '../model/Media.dart';
import '../services/RemoteServices.dart';

class MediaController extends GetxController {
  var audioList = <Media>[].obs;
  var videoList = <Media>[].obs;

  void fetchAudios() async {
    var audio = await RemoteServices.fetchMedia('AUDIO_BOOK');
    if (audio.isNotEmpty) {
      audioList.value = audio;
    }
    print(audio.length);
  }

  void fetchVideos() async {
    var video = await RemoteServices.fetchMedia('VIDEO_CLASS');
    if (video.isNotEmpty) {
      videoList.value = video;
    }
  }

  void filterVideoBySubject(selectedSubject) async {
    var video = await RemoteServices.fetchMedia('VIDEO_CLASS');
    final filteredCourses = video.where((course) =>
    course.contentType == selectedSubject).toList();

    //print(filteredCourses.length);
    //if(filteredCourses.isNotEmpty) {
    videoList.value = filteredCourses;
    //}
    update();
  }

  void filterVideoBySearch(searchQuery) async {
    var video = await RemoteServices.fetchMedia('VIDEO_CLASS');
    videoList.clear();
    video.forEach((v) {
      final titleMatch = v.title.toLowerCase().contains(
          searchQuery.toLowerCase());
      final descriptionMatch = v.shortDescription.toLowerCase().contains(
          searchQuery.toLowerCase());
      final priceMatch = v.subject.toLowerCase().contains(searchQuery);

      if (titleMatch || descriptionMatch || priceMatch) {
        videoList.add(v);
      }
    });
  }
  void filterAudioBySubject(selectedSubject) async {
    var video = await RemoteServices.fetchMedia('AUDIO_BOOK');
    final filteredCourses = video.where((course) =>
    course.contentType == selectedSubject).toList();

    //print(filteredCourses.length);
    //if(filteredCourses.isNotEmpty) {
    audioList.value = filteredCourses;
    //}
    update();
  }

  void filterAudioBySearch(searchQuery) async {
    var video = await RemoteServices.fetchMedia('AUDIO_BOOK');
    audioList.clear();
    video.forEach((v) {
      final titleMatch = v.title.toLowerCase().contains(
          searchQuery.toLowerCase());
      final descriptionMatch = v.shortDescription.toLowerCase().contains(
          searchQuery.toLowerCase());
      final priceMatch = v.subject.toLowerCase().contains(searchQuery);

      if (titleMatch || descriptionMatch || priceMatch) {
        audioList.add(v);
      }
    });
  }

}