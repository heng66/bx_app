import 'package:flutter/material.dart';
import '../../model/home/homecontent_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeAdPage extends StatelessWidget {
  final HomeContentData contentData;
  const HomeAdPage(this.contentData,{Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
      color: Colors.white,
      child: Image.network(
                contentData.advertesPicture.pICTUREADDRESS,
                width: ScreenUtil().setWidth(750)),
    );
  }
}
