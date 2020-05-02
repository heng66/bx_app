import 'package:bx_app/model/category/category_list_request_model.dart';
import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../../model/category/category_nav_model.dart';
import '../../provide/categoryprovide/category_nav_provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../model/category/category_list_request_model.dart';

class CategoryTopNavPage extends StatefulWidget {
  CategoryTopNavPage({Key key}) : super(key: key);

  @override
  _CategoryTopNavPageState createState() => _CategoryTopNavPageState();
}

class _CategoryTopNavPageState extends State<CategoryTopNavPage> {  

  var selectedIndex = 0;
  Widget _topNavListViewWidget(CategoryNavProvide navProvide,
      List<BxMallSubDto> allBxMallSubDto, int index) {
    bool isSelected = (index == selectedIndex ? true : false);
    return InkWell(
        onTap: () {
          String categoryId = '';
          String categorySubId = '';
          categoryId = navProvide
              .categoryNavModel.data[navProvide.leftSelectedIndex].mallCategoryId;
          categorySubId = allBxMallSubDto[index].mallSubId;
          String page = '1';
          Map<String, String> params = {
            'categoryId': categoryId,
            'categorySubId': categorySubId,
            'page': page
          };

          print('right ---- > $params');

          CategoryListRequestModel()
              .categoryListRequest(context, params: params);

          Provide.value<CategoryNavProvide>(context).listRequestParams(params);
          Provide.value<CategoryNavProvide>(context)
              .changeRightSelectedIndex(index);
        },
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.fromLTRB(
              ScreenUtil().setWidth(20), 0, ScreenUtil().setWidth(10), 0),
          child: Text(
            allBxMallSubDto[index].mallSubName,
            style: TextStyle(
                color: isSelected == true ? Colors.red : Colors.black,
                fontSize: ScreenUtil().setSp(28)),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    Map<String, String> parmas = Provide.value<CategoryNavProvide>(context).params;
    CategoryListRequestModel().categoryListRequest(context,params: parmas);

    return Container(
      width: ScreenUtil().setWidth(570),
      height: ScreenUtil().setWidth(100),
      alignment: Alignment.center,
      color: Colors.white,
      child: Provide<CategoryNavProvide>(
        builder: (BuildContext context, Widget child,
            CategoryNavProvide navProvide) {
          if (navProvide.categoryNavModel == null) {
            return Text('暂无数据');
          }
          selectedIndex = navProvide.rightSelectedIndex;
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: navProvide.allBxMallSubDto.length,
            itemBuilder: (BuildContext context, int index) {
              return _topNavListViewWidget(
                  navProvide, navProvide.allBxMallSubDto, index);
            },
          );
        },
      ),
    );
  }
}
