import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../model/home/homecontent_model.dart';

class HomeQualityGoodsPage extends StatelessWidget {
  final HomeContentData contentData;
  const HomeQualityGoodsPage(this.contentData,{Key key}) : super(key: key);

  Widget _imageWidget(BuildContext context, HomeContentData contentData, int tag) {
  
    String imageName = (tag == 1?contentData.floor1Pic.pICTUREADDRESS:tag == 2?contentData.floor2Pic.pICTUREADDRESS:contentData.floor3Pic.pICTUREADDRESS);
    return Image.network(
      imageName,
      width: ScreenUtil().setWidth(700),
      height: ScreenUtil().setWidth(120),
    );
  }

  Widget _goodsWidget(
      BuildContext context, HomeContentData contentData, int tag) {
  
    Widget rowWidget = Row(
      children: <Widget>[
        Column(
          children: <Widget>[
            _imageItemWidget(
                context, tag==1?contentData.floor1[0].image:tag==2?contentData.floor2[0].image:contentData.floor3[0].image),
            _imageItemWidget(
                context, tag==1?contentData.floor1[3].image:tag==2?contentData.floor2[3].image:contentData.floor3[3].image),
          ],
        ),
        Column(
          children: <Widget>[
            _imageItemWidget(
                context, tag==1?contentData.floor1[1].image:tag==2?contentData.floor2[1].image:contentData.floor3[1].image),
            _imageItemWidget(
                context, tag==1?contentData.floor1[2].image:tag==2?contentData.floor2[2].image:contentData.floor3[2].image),
            _imageItemWidget(
                context, tag==1?contentData.floor1[4].image:tag==2?contentData.floor2[4].image:contentData.floor3[4].image),
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
      child: Column(
            children: <Widget>[
              _imageWidget(context, contentData, 1),
              _goodsWidget(context, contentData, 1),
              _imageWidget(context, contentData, 2),
              _goodsWidget(context, contentData, 2),
              _imageWidget(context, contentData, 3),
              _goodsWidget(context, contentData, 3),
            ],
          ),
    );
  }
}
