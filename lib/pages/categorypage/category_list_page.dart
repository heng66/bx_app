import 'package:bx_app/model/category/category_list_request_model.dart';
import 'package:bx_app/provide/category_provide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bx_app/model/category/category_list_model.dart';
import 'package:bx_app/routers/application.dart';
import 'package:fluro/fluro.dart';
import 'package:provide/provide.dart';

class CategoryListPage extends StatefulWidget {
  final List<CategoryListData> categoryListData;
  CategoryListPage(this.categoryListData, {Key key}) : super(key: key);

  @override
  _CategoryListPageState createState() => _CategoryListPageState();
}

class _CategoryListPageState extends State<CategoryListPage> {
  var scrollController = new ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  Widget _gridItem(List<CategoryListData> categoryListData, int index) {
    return InkWell(
        onTap: () {
          String goodID = widget.categoryListData[index].goodsId;
          String goodName = widget.categoryListData[index].goodsName;
          goodName = Uri.encodeQueryComponent(goodName);
          Application.router.navigateTo(
              context, "/detailpage?goodsID=$goodID&goodsName=$goodName",
              transition: TransitionType.fadeIn);
        },
        child: Container(
          width: ScreenUtil().setWidth(200),
          height: ScreenUtil().setWidth(200),
          margin: EdgeInsets.all(ScreenUtil().setWidth(10)),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.red, width: 1),
            color: Colors.white,
          ),
          child: Column(
            children: <Widget>[
              SizedBox(height: ScreenUtil().setWidth(20)),
              Image.network(
                widget.categoryListData[index].image,
                width: ScreenUtil().setWidth(120),
                height: ScreenUtil().setWidth(120),
              ),
              SizedBox(height: ScreenUtil().setWidth(20)),
              Text(
                widget.categoryListData[index].goodsName,
                maxLines: 1,
                overflow: TextOverflow.clip,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: ScreenUtil().setSp(22),
                ),
              ),
              SizedBox(height: ScreenUtil().setWidth(20)),
              Text('价格:¥${widget.categoryListData[index].presentPrice}',
                  style: TextStyle(
                      color: Colors.red, fontSize: ScreenUtil().setSp(22))),
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          width: ScreenUtil().setWidth(570),
          alignment: Alignment.center,
          child: widget.categoryListData.length == 0
              ? Text(
                  '暂无数据',
                  style: TextStyle(
                      color: Colors.black, fontSize: ScreenUtil().setSp(32)),
                )
              : EasyRefresh(
                  child: GridView.builder(
                    controller: scrollController,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.0,
                    ),
                    itemCount: widget.categoryListData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _gridItem(widget.categoryListData, index);
                    },
                  ),
                )),
    );
  }
}
