import 'package:flutter/material.dart';
import '../model/home/home_hot_list_model.dart';

class HomeHotListProvide with ChangeNotifier {
  List<HomeHotListData> hotList = [];

  addHotList (List<HomeHotListData> list) {
    hotList.addAll(list);
    notifyListeners();
  }
}