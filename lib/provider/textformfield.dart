import 'package:flutter/foundation.dart';

class AppState extends ChangeNotifier {
  String someValue = "";
  updateSomeValue(String newValue) {
    someValue = newValue;
    notifyListeners();
  }
}

class AppState1 extends ChangeNotifier {
  String someValuee = "";
  updateSomeValue(String newValue) {
    someValuee = newValue;
    notifyListeners();
  }
}

class AppState2 extends ChangeNotifier {
  String someValueee = "";
  updateSomeValue(String newValue) {
    someValueee = newValue;
    notifyListeners();
  }
}

class AppState3 extends ChangeNotifier {
  String someValues = "";
  updateSomeValue(String newValue) {
    someValues = newValue;
    notifyListeners();
  }
}
