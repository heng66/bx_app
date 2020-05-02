import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import '../../provide/homecontent_provide.dart';
import '../../model/home/homecontent_model.dart';

class HomeTopCategoryPage extends StatefulWidget {
  HomeTopCategoryPage({Key key}) : super(key: key);

  @override
  _HomeTopCategoryPageState createState() => _HomeTopCategoryPageState();
}

class _HomeTopCategoryPageState extends State<HomeTopCategoryPage> {
  Widget _getTopCategoryWidget(
      BuildContext context, int index, HomeContentProvide contentProvide) {
    if (contentProvide.contentModel == null) {
      return Text('...');
    }

    return Container(
        width: ScreenUtil().setWidth(150),
        height: ScreenUtil().setWidth(150),
        child: Column(children: <Widget>[
          Image.network(contentProvide.contentModel.data.category[index].image,
              width: ScreenUtil().setWidth(96),
              height: ScreenUtil().setWidth(96)),
          Container(
              height: ScreenUtil().setWidth(24),
              child: Text(
                  contentProvide
                      .contentModel.data.category[index].mallCategoryName,
                  style: TextStyle(fontSize: ScreenUtil().setSp(20))))
        ]));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: ScreenUtil().setWidth(8)),
      height: ScreenUtil().setWidth(306),
      child: Provide<HomeContentProvide>(builder: (BuildContext context,
          Widget child, HomeContentProvide contentProvide) {
        return GridView.builder(
            scrollDirection: Axis.horizontal,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.0,
              crossAxisSpacing: ScreenUtil().setWidth(6),
            ),
            itemCount: contentProvide.contentModel != null
                ? contentProvide.contentModel.data.category.length
                : 0,
            itemBuilder: (BuildContext context, int index) {
              return _getTopCategoryWidget(context, index, contentProvide);
            });
      }),
    );
  }
}
