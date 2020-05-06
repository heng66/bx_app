import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../model/home/homecontent_model.dart';

class HomeTopCategoryPage extends StatefulWidget {
  final HomeContentData contentData;
  HomeTopCategoryPage(this.contentData, {Key key}) : super(key: key);

  @override
  _HomeTopCategoryPageState createState() => _HomeTopCategoryPageState();
}

class _HomeTopCategoryPageState extends State<HomeTopCategoryPage> {
  Widget _getTopCategoryWidget(
      BuildContext context, int index, HomeContentData contentData) {
    return Container(
        width: ScreenUtil().setWidth(150),
        height: ScreenUtil().setWidth(150),
        color: Colors.white,
        child: Column(children: <Widget>[
          Image.network(contentData.category[index].image,
              width: ScreenUtil().setWidth(96),
              height: ScreenUtil().setWidth(96)),
          Container(
              height: ScreenUtil().setWidth(24),
              child: Text(contentData.category[index].mallCategoryName,
                  style: TextStyle(fontSize: ScreenUtil().setSp(20))))
        ]));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: ScreenUtil().setWidth(8)),
        height: ScreenUtil().setWidth(306),
        child: GridView.builder(
            scrollDirection: Axis.horizontal,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.0,
              crossAxisSpacing: ScreenUtil().setWidth(6),
            ),
            itemCount: widget.contentData.category.length,
            itemBuilder: (BuildContext context, int index) {
              return _getTopCategoryWidget(context, index, widget.contentData);
            }));
  }
}
