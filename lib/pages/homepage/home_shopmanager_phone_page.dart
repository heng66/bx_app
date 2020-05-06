import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../model/home/homecontent_model.dart';

class HomeShopManagerPhonePage extends StatelessWidget {
  final HomeContentData contentData;
  const HomeShopManagerPhonePage(this.contentData,{Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(5), ScreenUtil().setWidth(5), ScreenUtil().setWidth(5), 0),
      child: Image.network(contentData.shopInfo.leaderImage, width: ScreenUtil().setWidth(740))

    );
  }
}