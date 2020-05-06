import 'package:flutter/material.dart';
import '../../model/home/home_hot_list_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeHotListPage extends StatefulWidget {
  final List<HomeHotListData> hotList;
  HomeHotListPage(this.hotList, {Key key}) : super(key: key);

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
    if (widget.hotList.length == 0) {
      return Text('暂无数据');
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
        itemCount: widget.hotList.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: ScreenUtil().setWidth(20)),
              _imageInforWidget(widget.hotList, index),
              _descpribtionWidget(widget.hotList, index),
              _priceWidget(widget.hotList, index),
            ],
          );
        },
      ),
    );
  }
}
