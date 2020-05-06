import 'dart:async';
import 'dart:convert';
import 'package:bx_app/common/network_utils.dart';
import 'package:bx_app/common/url_utils.dart';
import 'package:bx_app/model/home/homecontent_model.dart';
import 'package:dio/dio.dart';

class HomeContentRequestModel {
  Future<HomeContentModel> homePageContentRequest({Map<String, dynamic> params}) async {
    Response response = await NetWorkUtils(baseUrl: UrlUtils.Base_Url)
        .request(UrlUtils.Home_Url, params: params, method: Method.post);

    if (response == null || response.statusCode != 200) {
      return HomeContentModel();
    }

    var data = json.decode(response.data);
    HomeContentModel model = HomeContentModel.fromJson(data);
    return model;
  }
}
