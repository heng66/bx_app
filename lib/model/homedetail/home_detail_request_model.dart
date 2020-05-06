import 'package:bx_app/provide/home_detail_provide.dart';
import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'dart:convert';
import 'home_detail_model.dart';
import '../../common/service_method.dart';

class HomeDetailRequestModel {

  homedetailRequest(BuildContext context, String goodId) async {
    var params = {'goodId':goodId};
    await request('getGoodDetailById', paramsData: params).then((value) {
      var data = json.decode(value);
      HomeDetailModel model = HomeDetailModel.fromJson(data);
      Provide.value<HomeDetailProvide>(context).saveHomeDetailModel(model);
    });
  }

}