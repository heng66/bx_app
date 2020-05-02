import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import '../../service/service_method.dart';
import 'package:provide/provide.dart';
import '../../provide/homecontent_provide.dart';
import '../../model/home/homecontent_model.dart';

class HomeContentRequestModel {
  homePageContentRequest(BuildContext context) async {
    await getHomePageContent().then((value) {
      var data = json.decode(value.toString());
      HomeContentModel model = new HomeContentModel.fromJson(data);
      Provide.value<HomeContentProvide>(context).setHomeContentModel(model);
    });
  }
}
