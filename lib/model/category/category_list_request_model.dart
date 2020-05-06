import 'dart:convert';
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:bx_app/model/category/category_list_model.dart';
import 'package:bx_app/common/network_utils.dart';
import 'package:bx_app/common/url_utils.dart';

class CategoryListRequestModel {
  Future<CategoryListModel> categoryListRequest(
      {Map<String, String> params}) async {
    Response response = await NetWorkUtils(baseUrl: UrlUtils.Base_Url)
        .request(UrlUtils.Category_List_Url, params: params);

    if (response == null || response.statusCode != 200) {
      return CategoryListModel();
    }
    var data = json.decode(response.data);
    CategoryListModel model = CategoryListModel.fromJson(data);
    return model;
  }
}
