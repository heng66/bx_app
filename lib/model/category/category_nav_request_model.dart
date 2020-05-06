import 'dart:convert';
import 'dart:async';
import 'package:bx_app/model/category/category_nav_model.dart';
import 'package:dio/dio.dart';
import 'package:bx_app/common/network_utils.dart';
import 'package:bx_app/common/url_utils.dart';

class CategoryNavRequestModel {
  Future<CategoryNavModel> categoryNavRequest() async{
    Response response = await NetWorkUtils(baseUrl: UrlUtils.Base_Url)
        .request(UrlUtils.Category_Url);

    if (response == null || response.statusCode != 200) {
      return CategoryNavModel();
    }
    var data = json.decode(response.data);
    CategoryNavModel model = CategoryNavModel.fromJson(data);
    return model;
  }
}
