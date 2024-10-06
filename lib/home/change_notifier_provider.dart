import 'package:flutter/foundation.dart';
import 'package:riverpod_tutorial/model/user_model.dart';

class ChangeNotifierProviderExample extends ChangeNotifier {
  User user = User(name: "", age: 0);

  void updateName(String name) {
    user = user.copyWith(name: name);
    notifyListeners(); // is that function  necessary? the state chabnge  is already detected by the provider
  }

  void updateAge(int ageType) {
    user = user.copyWith(age: ageType);
    notifyListeners(); // is that function  necessary? the state chabnge  is already detected by the provider
  }
}
