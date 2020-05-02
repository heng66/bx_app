import 'package:flutter/material.dart';
import '../model/home/homecontent_model.dart';

class HomeContentProvide with ChangeNotifier {
  HomeContentModel contentModel;

  setHomeContentModel(HomeContentModel model) {
    contentModel = model;
    notifyListeners();
  }
}