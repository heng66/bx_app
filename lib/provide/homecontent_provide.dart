import 'package:flutter/material.dart';
import '../model/home/homecontent_model.dart';
import '../model/home/home_hot_list_model.dart';

class HomeContentProvide with ChangeNotifier {
  HomeContentModel _contentModel;
  HomeContentData _contentData;
  String _code;
  String _message;
  List<HomeHotListData> _hotList = [];

  HomeContentModel get contentModel => _contentModel;
  HomeContentData get contentData => _contentData;
  String get code => _code;
  String get message => _message;
  List<HomeHotListData> get hotList => _hotList;

  setHomeContentModel(HomeContentModel model) async {
    this._contentModel = model;
    this._contentData = model.data;
    this._message = model.message;
    this._code = model.code;
    notifyListeners();
  }

  addHotList(List<HomeHotListData> list) async {
    this._hotList.addAll(list);
    notifyListeners();
  }
}
