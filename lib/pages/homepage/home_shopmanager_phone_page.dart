import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../model/home/homecontent_model.dart';
import '../../provide/homecontent_provide.dart';

class HomeShopManagerPhonePage extends StatelessWidget {
  const HomeShopManagerPhonePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(5), ScreenUtil().setWidth(5), ScreenUtil().setWidth(5), 0),
      child: Provide<HomeContentProvide>(
        builder: (BuildContext context, Widget child, HomeContentProvide contentProvide) {
          if (contentProvide.contentModel != null) {
            return Image.network(contentProvide.contentModel.data.shopInfo.leaderImage, width: ScreenUtil().setWidth(740));
          } else {
            return Text('...');
          }
        },
        )
    );
  }
}