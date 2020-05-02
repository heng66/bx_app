import 'package:flutter/material.dart';
import '../../model/category/category_list_model.dart';

class CategoryListProvide with ChangeNotifier {
  CategoryListModel categoryListModel;

  saveCategoryListModel(CategoryListModel listModel) {
    this.categoryListModel = listModel;
    notifyListeners();
  }
}
