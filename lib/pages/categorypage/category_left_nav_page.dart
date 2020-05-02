import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../../model/category/category_nav_model.dart';
import '../../provide/categoryprovide/category_nav_provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'category_top_nav_page.dart';
import '../../model/category/category_list_request_model.dart';

class CategoryLeftNavPage extends StatefulWidget {
  CategoryLeftNavPage({Key key}) : super(key: key);

  @override
  _CategoryLeftNavPageState createState() => _CategoryLeftNavPageState();
}

class _CategoryLeftNavPageState extends State<CategoryLeftNavPage> {
  var selectedIndex = 0;
  Widget _leftNavWidget(CategoryNavProvide navProvide, int index) {
    bool isSelected = (index == selectedIndex ? true : false);
    return InkWell(
        onTap: () {
          String categoryId = '';
          String categorySubId = '';
          categoryId = navProvide.categoryNavModel.data[index].mallCategoryId;
          if (isSelected) {}
          String page = '1';
          Map<String, String> params = {
            'categoryId': categoryId,
            'categorySubId': categorySubId,
            'page': page
          };
          print('params --- > $params');
          if (isSelected == false) {
            CategoryListRequestModel()
                .categoryListRequest(context, params: params);
                Provide.value<CategoryNavProvide>(context)
              .changeRightSelectedIndex(0);
          }

          Provide.value<CategoryNavProvide>(context).changeLeftSelectedIndex(index);
          Provide.value<CategoryNavProvide>(context)
              .changeRightSelectedIndex(navProvide.rightSelectedIndex);
          Provide.value<CategoryNavProvide>(context)
              .saveAllCategoryTitleList(navProvide.categoryNavModel.data[index].bxMallSubDto);
        },
        child: Container(
          alignment: Alignment.center,
          height: ScreenUtil().setWidth(100),
          color: isSelected == true ? Colors.black12 : Colors.white,
          child: Text(
            navProvide.categoryNavModel.data[index].mallCategoryName,
            style: TextStyle(
                color: Colors.black, fontSize: ScreenUtil().setSp(32)),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: ScreenUtil().setWidth(180),
        alignment: Alignment.center,
        child: Provide<CategoryNavProvide>(
          builder: (BuildContext context, Widget child,
              CategoryNavProvide navProvide) {
            selectedIndex = navProvide.leftSelectedIndex;
            if (navProvide.categoryNavModel == null) {
              return Text('暂无数据');
            }
            return Container(
              decoration: BoxDecoration(
                  border: Border(
                      right: BorderSide(width: 1, color: Colors.black12))),
              child: ListView.builder(
                itemCount: navProvide.categoryNavModel.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return _leftNavWidget(navProvide, index);
                },
              ),
            );
          },
        ));
  }
}
