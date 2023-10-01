import 'package:flutter/material.dart';
import 'package:want_to_go_home/core/hive_helper.dart';
import 'package:want_to_go_home/models/phone.dart';

class PhoneList extends ChangeNotifier {

  static List<Phone> _items = [];

  List<Phone> get items {
    return _items;
  }

  static List<Phone> _accessPhone = [];

  List<Phone> get accessPhone {
    return _accessPhone;
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

  Future<void> deletePhone(Phone phone)async {
    var db = await HiveHelper.getDB<Phone>('list_access');
    if(_items.contains(phone)){
      db.deleteAt(_items.indexOf(phone));
      _items.remove(phone);
    }
    notifyListeners();
  }

  Future<void> editPhone(Phone phone)async {

  }

  Future<void> changeAccessPhone(String title, String number)async {
    final newPhone = Phone(title, number);
    (await HiveHelper.getDB<Phone>('access_phone')).clear();
    _accessPhone.clear();
    _accessPhone.add(newPhone);
    (await HiveHelper.getDB<Phone>('access_phone')).add(newPhone);
    notifyListeners();
  }

  Future<void> setAccessPhone()async {
    _accessPhone = (await HiveHelper.getDB<Phone>('access_phone'))
        .values.toList();
    notifyListeners();
  }

}
