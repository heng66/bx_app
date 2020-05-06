import 'package:bx_app/provide/home_detail_provide.dart';
import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:flutter_html/flutter_html.dart';

class HomeDetailWebPage extends StatefulWidget {
  HomeDetailWebPage({Key key}) : super(key: key);

  @override
  _HomeDetailWebPageState createState() => _HomeDetailWebPageState();
}

class _HomeDetailWebPageState extends State<HomeDetailWebPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Provide<HomeDetailProvide>(builder: (BuildContext context, Widget child, HomeDetailProvide detailProvide) {
        return Column(
        children: <Widget>[
          Text('详情',style: TextStyle(color:Colors.red,fontSize:18),),
          SizedBox(height:10),
          detailProvide.detailModel == null?Text('暂无数据',style: TextStyle(color:Colors.red,fontSize:18),):Html(
          data: detailProvide.detailModel.data.goodInfo.goodsDetail,
          defaultTextStyle: TextStyle(fontSize: 18.0),
          padding: EdgeInsets.all(8.0),
          blockSpacing: 2.0),
        ],
      );
      },),
    );
  }
}
