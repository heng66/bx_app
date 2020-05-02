import 'package:bx_app/provide/homecontent_provide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import '../../model/home/homecontent_model.dart';

class HomeRecommendPage extends StatelessWidget {
  const HomeRecommendPage({Key key}) : super(key: key);

  Widget _titleWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(5, 5, 0, 0),
      child: Text('商品推荐', style: TextStyle(fontSize: 20, color: Colors.red)),
    );
  }

  Widget _goodsShowDetailWidget(
      BuildContext context, int index, HomeContentProvide contentProvide) {
    if (contentProvide.contentModel == null) {
      return Text(' ');
    }
    Widget widget = Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              right: BorderSide(width: 1, color: Colors.black12),
              top: BorderSide(width: 1, color: Colors.black12))),
      alignment: AlignmentDirectional.center,
      height: ScreenUtil().setWidth(360),
      width: ScreenUtil().setWidth(750),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: ScreenUtil().setWidth(20),
            child: Image.network(
              contentProvide.contentModel.data.recommend[index].image,
              width: ScreenUtil().setWidth(240),
              height: ScreenUtil().setWidth(240),
            ),
          ),
          Positioned(
              top: ScreenUtil().setWidth(260),
              left: 0,
              right: 0,
              child: Text(
                '¥: ${contentProvide.contentModel.data.recommend[index].mallPrice}',
                style: TextStyle(fontSize: 14, color: Colors.black),
                textAlign: TextAlign.center,
              )),
          Positioned(
              top: ScreenUtil().setWidth(300),
              left: 0,
              right: 0,
              child: Text(
                  '¥: ${contentProvide.contentModel.data.recommend[index].price}',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black12,
                    decoration: TextDecoration.lineThrough,
                  ),
                  textAlign: TextAlign.center)),
        ],
      ),
    );
    return widget;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Provide<HomeContentProvide>(
        builder: (BuildContext context, Widget child,
            HomeContentProvide contentProvide) {
          if (contentProvide.contentModel.data == null) {
            return Text('...');
          }
          return Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                _titleWidget(context),
                Container(
                  height: ScreenUtil().setWidth(360),
                  child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1, childAspectRatio: 1.5),
                      itemCount:
                          contentProvide.contentModel.data.recommend.length,
                      itemBuilder: (BuildContext context, int index) {
                        return _goodsShowDetailWidget(
                            context, index, contentProvide);
                      }),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
