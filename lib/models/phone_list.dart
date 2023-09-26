import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:want_to_go_home/models/phone.dart';

class PhoneList extends ChangeNotifier {
  final prefList = SharedPreferences.getInstance();
  final String listKey = 'listKey';

  static final List<Phone> _items = [];

  List<Phone> get items {
    return _items;
  }

  void addListPhone(String title, String number) {
    final newPhone = Phone(title, number);
    _items.add(newPhone);
    notifyListeners();
  }
}
