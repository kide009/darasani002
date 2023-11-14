import 'package:darasani/model/Discussion.dart';
import 'package:get/get.dart';
import '../services/RemoteServices.dart';

class DiscussionController extends GetxController{

  var discussionList = <Discussion>[].obs;
  void fetchDiscussions()async{
    var discussions = await RemoteServices.fetchDiscussions();
    if(discussions.isNotEmpty) {
      discussionList.value = discussions;
    }
  }

}