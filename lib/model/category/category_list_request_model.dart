import 'package:bx_app/service/service_method.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:provide/provide.dart';
import '../../model/category/category_list_model.dart';
import '../../provide/categoryprovide/category_list_provide.dart';

class CategoryListRequestModel {
  categoryListRequest(BuildContext context, {Map<String,String> params}) async {
    await request('getMallGoods',paramsData: params).then((value) {
      var jsonData = json.decode(value);
      // print('json -- > $jsonData');
      CategoryListModel model = CategoryListModel.fromJson(jsonData);
      Provide.value<CategoryListProvide>(context).saveCategoryListModel(model);
    });
  }
}
