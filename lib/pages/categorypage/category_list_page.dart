import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import '../../model/category/category_list_model.dart';
import '../../provide/categoryprovide/category_list_provide.dart';
import '../../model/category/category_list_request_model.dart';
import '../../provide/categoryprovide/category_nav_provide.dart';

class CategoryListPage extends StatefulWidget {
  CategoryListPage({Key key}) : super(key: key);

  @override
  _CategoryListPageState createState() => _CategoryListPageState();
}

class _CategoryListPageState extends State<CategoryListPage> {

  var scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: ScreenUtil().setWidth(570),
        alignment: Alignment.center,
        child: Provide<CategoryListProvide>(
          builder: (BuildContext context, Widget child,
              CategoryListProvide listProvide) {
            if (listProvide.categoryListModel.data == null) {
              return Text('暂无数据');
            }
            // String page = Provide.value<CategoryNavProvide>(context).params['page'];
            // int presentPage = int.parse(page);
            // if (presentPage == 1) {
            //   scrollController.jumpTo(0.0);
            // }
            return GridView.builder(
              controller: scrollController,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.0,
              ),
              itemCount: listProvide.categoryListModel.data.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
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
                        listProvide.categoryListModel.data[index].image,
                        width: ScreenUtil().setWidth(120),
                        height: ScreenUtil().setWidth(120),
                      ),
                      SizedBox(height: ScreenUtil().setWidth(20)),
                      Text(
                        listProvide.categoryListModel.data[index].goodsName,
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: ScreenUtil().setSp(22),
                            ),
                      ),
                      SizedBox(height: ScreenUtil().setWidth(20)),
                      Text(
                          '价格:¥${listProvide.categoryListModel.data[index].presentPrice}',
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: ScreenUtil().setSp(22))),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
