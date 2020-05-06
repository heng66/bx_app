import 'package:flutter/material.dart';
import 'package:bx_app/model/category/category_nav_model.dart';
import 'package:bx_app/model/category/category_list_model.dart';

class CategoryProvide with ChangeNotifier {
  String code;
  String message;
  List<CategoryNavData> _categoryNavData;
  List<BxMallSubDto> _allBxMallSubDto;
  BxMallSubDto _mallSubDto;
  //左侧导航栏被选中index
  int _leftSelectedIndex = 0;
  //右侧导航栏被选中index
  int rightSelectedIndex = 0;
  //list列表 params参数
  Map<String, String> params;
  List<CategoryListData> _categoryListData;

  List<CategoryNavData> get categoryNavData => _categoryNavData;
  List<BxMallSubDto> get allBxMallSubDto => _allBxMallSubDto;
  BxMallSubDto get mallSubDto => _mallSubDto;
  List<CategoryListData> get categoryListData => _categoryListData;
  int get leftSelectedIndex => _leftSelectedIndex;


  saveCategoryListModel(CategoryListModel listModel) async {
    this._categoryListData = listModel.data;
    notifyListeners();
  }

  addCategoryListModel(CategoryListModel listModel) async {
    this._categoryListData.addAll(listModel.data);
    notifyListeners();
  }

  saveCategoryNavModel(CategoryNavModel model) async {
    this.message = model.message;
    this.code = model.code;
    this._categoryNavData = model.data;
    notifyListeners();
  }
  
  changeLeftSelectedIndex(int index) {
    this._leftSelectedIndex = index;
    notifyListeners();
  }

  changeRightSelectedIndex(int index) {
    this.rightSelectedIndex = index;
    notifyListeners();
  }

  listRequestParams(Map<String,dynamic> params) {
    this.params = params;
    notifyListeners();
  }

  saveAllCategoryTitleList(List<BxMallSubDto> bxMallSubDto) {
    this._mallSubDto = BxMallSubDto();
    this._mallSubDto.mallSubId = '';
    this._mallSubDto.mallCategoryId = '00';
    this._mallSubDto.mallSubName = '全部';
    this._mallSubDto.comments = 'null';
    this._allBxMallSubDto = new List<BxMallSubDto>();
    this._allBxMallSubDto.add(mallSubDto);
    this._allBxMallSubDto.addAll(bxMallSubDto);
    notifyListeners();
  }
}
