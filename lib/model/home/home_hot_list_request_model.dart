import 'package:flutter/material.dart';
import '../../provide/home_hot_list_provide.dart';
import '../../pages/homepage/home_hot_list_page.dart';
import '../../model/home/home_hot_list_model.dart';
import 'package:provide/provide.dart';
import 'dart:async';
import 'dart:convert';
import '../../service/service_method.dart';

class HomeHotListRequestModel {

  int page = 1;

  getHotGoodsInfor(BuildContext context) async {
    var paramsData = {'page': page};
    await request('homePageBelowConten', paramsData: paramsData).then((val) {
      var data = json.decode(val.toString());
      HomeHotListModel model = HomeHotListModel.fromJson(data);
      Provide.value<HomeHotListProvide>(context).addHotList(model.data);
      page++;
    });
  }
}
