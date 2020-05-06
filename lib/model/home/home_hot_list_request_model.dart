import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:bx_app/common/network_utils.dart';
import 'package:bx_app/common/url_utils.dart';
import 'package:bx_app/model/home/home_hot_list_model.dart';

class HomeHotListRequestModel {

  Future<HomeHotListModel> homeHotGoodsRequest({int page:1}) async {
    Map<String, dynamic> params = {'page': page};
    Response response = await NetWorkUtils(baseUrl: UrlUtils.Base_Url)
        .request(UrlUtils.Home_Hot_Url, params: params, method: Method.post);

    if (response == null || response.statusCode != 200) {
      return HomeHotListModel();
    }

    var data = json.decode(response.data);
    HomeHotListModel model = HomeHotListModel.fromJson(data);
    return model;
  }

}
