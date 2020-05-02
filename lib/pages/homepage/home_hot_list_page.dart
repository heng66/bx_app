import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../../model/home/home_hot_list_model.dart';
import '../../provide/home_hot_list_provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeHotListPage extends StatefulWidget {
  HomeHotListPage({Key key}) : super(key: key);

  @override
  _HomeHotListPageState createState() => _HomeHotListPageState();
}

class _HomeHotListPageState extends State<HomeHotListPage> {
  Widget _imageInforWidget(List<HomeHotListData> hotList, int index) {
    return Image.network(hotList[index].image,
        width: ScreenUtil().setWidth(200), height: ScreenUtil().setWidth(200));
  }

  Widget _descpribtionWidget(List<HomeHotListData> hotList, int index) {
    return Text(
      hotList[index].name,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(color: Colors.red, fontSize: ScreenUtil().setSp(28)),
    );
  }

  Widget _priceWidget(List<HomeHotListData> hotList, int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          '¥${hotList[index].mallPrice.toString()}',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style:
              TextStyle(color: Colors.black, fontSize: ScreenUtil().setSp(28)),
        ),
        SizedBox(
          width: ScreenUtil().setWidth(10),
        ),
        Text(
          hotList[index].price.toString(),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Colors.black,
            fontSize: ScreenUtil().setSp(28),
            decoration: TextDecoration.lineThrough,
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    List<HomeHotListData> hotList =
        Provide.value<HomeHotListProvide>(context).hotList;
      if (hotList.length == 0) {
        return Text('...');
      }
    return Container(
      color: Colors.white,
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 0,
            crossAxisSpacing: 0,
            childAspectRatio: 1.2),
        itemCount: hotList.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: ScreenUtil().setWidth(20)),
              _imageInforWidget(hotList, index),
              _descpribtionWidget(hotList, index),
              _priceWidget(hotList, index),
            ],
          );
        },
      ),
    );
  }
}
