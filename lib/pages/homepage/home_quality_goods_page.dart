import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../model/home/homecontent_model.dart';
import '../../provide/homecontent_provide.dart';

class HomeQualityGoodsPage extends StatelessWidget {
  const HomeQualityGoodsPage({Key key}) : super(key: key);

  Widget _imageWidget(BuildContext context, HomeContentProvide contentProvide, int tag) {
    if (contentProvide.contentModel.data == null) {
      return Text('...');
    }

    String imageName = (tag == 1?contentProvide.contentModel.data.floor1Pic.pICTUREADDRESS:tag == 2?contentProvide.contentModel.data.floor2Pic.pICTUREADDRESS:contentProvide.contentModel.data.floor3Pic.pICTUREADDRESS);
    return Image.network(
      imageName,
      width: ScreenUtil().setWidth(700),
      height: ScreenUtil().setWidth(120),
    );
  }

  Widget _goodsWidget(
      BuildContext context, HomeContentProvide contentProvide, int tag) {
    if (contentProvide.contentModel.data == null) {
      return Text('...');
    }
    Widget rowWidget = Row(
      children: <Widget>[
        Column(
          children: <Widget>[
            _imageItemWidget(
                context, tag==1?contentProvide.contentModel.data.floor1[0].image:tag==2?contentProvide.contentModel.data.floor2[0].image:contentProvide.contentModel.data.floor3[0].image),
            _imageItemWidget(
                context, tag==1?contentProvide.contentModel.data.floor1[3].image:tag==2?contentProvide.contentModel.data.floor2[3].image:contentProvide.contentModel.data.floor3[3].image),
          ],
        ),
        Column(
          children: <Widget>[
            _imageItemWidget(
                context, tag==1?contentProvide.contentModel.data.floor1[1].image:tag==2?contentProvide.contentModel.data.floor2[1].image:contentProvide.contentModel.data.floor3[1].image),
            _imageItemWidget(
                context, tag==1?contentProvide.contentModel.data.floor1[2].image:tag==2?contentProvide.contentModel.data.floor2[2].image:contentProvide.contentModel.data.floor3[2].image),
            _imageItemWidget(
                context, tag==1?contentProvide.contentModel.data.floor1[4].image:tag==2?contentProvide.contentModel.data.floor2[4].image:contentProvide.contentModel.data.floor3[4].image),
          ],
        ),
      ],
    );
    return rowWidget;
  }

  Widget _imageItemWidget(BuildContext context, String imgName) {
    return Image.network(imgName, width: ScreenUtil().setWidth(375));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Provide<HomeContentProvide>(
        builder: (BuildContext context, Widget child,
            HomeContentProvide contentProvide) {
              return Column(
            children: <Widget>[
              _imageWidget(context, contentProvide, 1),
              _goodsWidget(context, contentProvide, 1),
              _imageWidget(context, contentProvide, 2),
              _goodsWidget(context, contentProvide, 2),
              _imageWidget(context, contentProvide, 3),
              _goodsWidget(context, contentProvide, 3),
            ],
          );
        },
      ),
    );
  }
}
