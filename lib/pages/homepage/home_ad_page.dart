import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../../provide/homecontent_provide.dart';
import '../../model/home/homecontent_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeAdPage extends StatelessWidget {
  const HomeAdPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
      child: Provide<HomeContentProvide>(
        builder: (BuildContext context, Widget child,
            HomeContentProvide contentProvide) {
          if (contentProvide.contentModel != null) {
            return Image.network(
                contentProvide.contentModel.data.advertesPicture.pICTUREADDRESS,
                width: ScreenUtil().setWidth(750));
          } else {
            return Text('...');
          }
        },
      ),
    );
  }
}
