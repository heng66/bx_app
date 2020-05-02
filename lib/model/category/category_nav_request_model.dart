import 'package:bx_app/service/service_method.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:provide/provide.dart';
import '../../model/category/category_nav_model.dart';
import '../../provide/categoryprovide/category_nav_provide.dart';
import '../category/category_nav_model.dart';

class CategoryNavRequestModel {
  categoryNavRequest(BuildContext context) async {
    await request('getCategory').then((value) {
      var jsonData = json.decode(value);
      CategoryNavModel model = CategoryNavModel.fromJson(jsonData);
      Provide.value<CategoryNavProvide>(context).saveCategoryNavModel(model);
      if (model.data.length > 0) {
        int index = Provide.value<CategoryNavProvide>(context).leftSelectedIndex;
        Provide.value<CategoryNavProvide>(context)
            .saveAllCategoryTitleList(model.data[index].bxMallSubDto);
      }
    });
  }
}
