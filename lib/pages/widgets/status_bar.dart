import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class StatusBar extends ChangeNotifier {
  bool _isStatusBarVisible = true;

  bool get isStatusBarVisible => _isStatusBarVisible;

  void hideStatusBar() {
    _isStatusBarVisible = false;
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    notifyListeners();
  }

  void showStatusBar() {
    _isStatusBarVisible = true;
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    notifyListeners();
  }
}