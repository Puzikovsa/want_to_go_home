import 'package:flutter/material.dart';
import 'package:want_to_go_home/core/hive_helper.dart';
import 'package:want_to_go_home/models/phone.dart';

class PhoneList extends ChangeNotifier {

  static List<Phone> _items = [];

  List<Phone> get items {
    return _items;
  }

  Future<void> addListPhone(String title, String number) async {
    final newPhone = Phone(title, number);
    _items.add(newPhone);
    (await HiveHelper.getDB<Phone>('list_access')).add(newPhone);
    notifyListeners();
  }
  Future<void> fetchAndSetListPhone()async {
    _items = (await HiveHelper.getDB<Phone>('list_access'))
        .values.toList();
  }
}
