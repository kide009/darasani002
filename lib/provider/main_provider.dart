import 'package:flutter/cupertino.dart';

class MainProvider extends ChangeNotifier {
  bool isLoading = false;
  bool isToggle = false;
  int index = 0;

  toggleDone() {
    isToggle != isToggle;
    notifyListeners();
  }

  changeIsLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  changeIndex(int ind) {
    index = ind;
    notifyListeners();
  }
}
