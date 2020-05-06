import 'package:bx_app/model/homedetail/home_detail_model.dart';
import 'package:flutter/material.dart';

class HomeDetailProvide with ChangeNotifier {
  HomeDetailModel _detailModel;
  HomeDetailModel get detailModel => _detailModel;

  saveHomeDetailModel(HomeDetailModel model) async {
    this._detailModel = model;
    notifyListeners();
  }
}
