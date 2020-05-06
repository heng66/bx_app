import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import '../pages/homedetailpage/home_detail_page.dart';

var detailHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String goodsID = params['goodsID']?.first;
  String goodsName = params['goodsName']?.first;
  return HomeDetailPage(goodsID,goodsName);
});
