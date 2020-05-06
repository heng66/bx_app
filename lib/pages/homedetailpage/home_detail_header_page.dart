import 'package:bx_app/model/homedetail/home_detail_model.dart';
import 'package:bx_app/provide/home_detail_provide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';

class HomeDetailHeaderPage extends StatefulWidget {
  HomeDetailHeaderPage({Key key}) : super(key: key);

  @override
  _HomeDetailHeaderPageState createState() => _HomeDetailHeaderPageState();
}

class _HomeDetailHeaderPageState extends State<HomeDetailHeaderPage> {
  Widget _imgeWidget(String imageName) {
    return Image.network(
      imageName,
      width: ScreenUtil().setWidth(750),
    );
  }

  Widget _descriptionWidget(HomeDetailModel model) {
    return Container(
      color: Colors.white,
      width: ScreenUtil().setWidth(750),
      padding: EdgeInsets.only(left: ScreenUtil().setWidth(30)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            model.data.goodInfo.goodsName,
            style: TextStyle(
                color: Colors.black, fontSize: ScreenUtil().setSp(32)),
            maxLines: 1,
            overflow: TextOverflow.clip,
          ),
          Text(
            '编号:${model.data.goodInfo.goodsSerialNumber}',
            style: TextStyle(
                color: Colors.black26, fontSize: ScreenUtil().setSp(30)),
            maxLines: 1,
            overflow: TextOverflow.clip,
          ),
          Text.rich(TextSpan(children: [
            TextSpan(
              text: '¥${model.data.goodInfo.presentPrice}',
              style: TextStyle(
                color: Colors.red,
                fontSize: ScreenUtil().setSp(32),
              ),
            ),
            TextSpan(
                text: "¥${model.data.goodInfo.oriPrice}",
                style: TextStyle(
                  color: Colors.black26,
                  fontSize: ScreenUtil().setSp(30),
                  decoration: TextDecoration.lineThrough,
                ),
                recognizer: null),
          ]))
        ],
      ),
    );
  }

  Widget _declareWidget () {
    return Container(
      color: Colors.white,
      width: ScreenUtil().setWidth(750),
      margin: EdgeInsets.only(top:ScreenUtil().setWidth(20)),
      padding: EdgeInsets.all(ScreenUtil().setWidth(20)),
          child:Text('说明: > 急速送达 > 正品保证',style: TextStyle(color:Colors.red,fontSize: ScreenUtil().setSp(30)),)
      );
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: Provide<HomeDetailProvide>(
      builder: (BuildContext context, Widget child,
          HomeDetailProvide detailProvide) {
        if (detailProvide.detailModel == null) {
          return Container(
            alignment: Alignment.center,
            child: Text('暂无数据'),
          );
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _imgeWidget(detailProvide.detailModel.data.goodInfo.image1),
            _descriptionWidget(detailProvide.detailModel),
            _declareWidget(),
          ],
        );
      },
    ));
  }
}
