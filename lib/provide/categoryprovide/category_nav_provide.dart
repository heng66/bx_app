import 'package:flutter/material.dart';
import '../../model/category/category_nav_model.dart';

class CategoryNavProvide with ChangeNotifier {
  CategoryNavModel categoryNavModel;
  List<BxMallSubDto> allBxMallSubDto;
  BxMallSubDto mallSubDto;
  //左侧导航栏被选中index
  int leftSelectedIndex = 0;
  //右侧导航栏被选中index
  int rightSelectedIndex = 0;
  //list列表 params参数
  Map<String,String> params;

  saveCategoryNavModel(CategoryNavModel navModel) {
    this.categoryNavModel = navModel;
    notifyListeners();
  }
  
  changeLeftSelectedIndex(int index) {
    this.leftSelectedIndex = index;
    notifyListeners();
  }

  changeRightSelectedIndex(int index) {
    this.rightSelectedIndex = index;
    notifyListeners();
  }

  listRequestParams(Map<String,String> params) {
    this.params = params;
    notifyListeners();
  }

  saveAllCategoryTitleList(List<BxMallSubDto> bxMallSubDto) {
    mallSubDto = BxMallSubDto();
    mallSubDto.mallSubId = '';
    mallSubDto.mallCategoryId = '00';
    mallSubDto.mallSubName = '全部';
    mallSubDto.comments = 'null';
    allBxMallSubDto = new List<BxMallSubDto>();
    allBxMallSubDto.add(mallSubDto);
    allBxMallSubDto.addAll(bxMallSubDto);
    notifyListeners();
  }
}
