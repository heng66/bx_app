import 'package:bx_app/model/homedetail/home_detail_request_model.dart';
import 'package:bx_app/pages/homedetailpage/home_detail_header_page.dart';
import 'package:bx_app/pages/homedetailpage/home_detail_web_page.dart';
import 'package:flutter/material.dart';

class HomeDetailPage extends StatelessWidget {
  final String goodsID;
  final String goodsName;
  HomeDetailPage(this.goodsID,this.goodsName);

  @override
  Widget build(BuildContext context) {
    HomeDetailRequestModel().homedetailRequest(context, goodsID);
    return Scaffold(
      appBar: AppBar(
        title: Text(goodsName),
      ),
      body: ListView(
          children: <Widget>[
            HomeDetailHeaderPage(),
            HomeDetailWebPage(),
          ],
      ),
    );
  }
}
