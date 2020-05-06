import 'package:flutter/material.dart';
import 'package:bx_app/model/category/category_list_model.dart';
import 'package:bx_app/model/category/category_list_request_model.dart';
import 'package:bx_app/model/category/category_nav_model.dart';
import 'package:bx_app/model/category/category_nav_request_model.dart';
import 'package:bx_app/pages/categorypage/category_left_nav_page.dart';
import 'package:bx_app/pages/categorypage/category_list_page.dart';
import 'package:bx_app/pages/categorypage/category_top_nav_page.dart';
import 'package:bx_app/provide/category_provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provide/provide.dart';
import 'dart:async';

class CategoryPage extends StatefulWidget {
  CategoryPage({Key key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  int leftIndex;
  int rightIndex;
  String categoryId;
  List<CategoryNavData> categoryNavData;
  List<BxMallSubDto> allBxMallSubDto;
  List<CategoryListData> categoryListData;

  @override
  void initState() {
    _getNavData(context);
    super.initState();
  }

  _getNavData(BuildContext context) async{
    CategoryNavModel model =
        await CategoryNavRequestModel().categoryNavRequest();
    Provide.value<CategoryProvide>(context).saveCategoryNavModel(model);
    if (model.data.length > 0) {
      int index = Provide.value<CategoryProvide>(context).leftSelectedIndex;
      Provide.value<CategoryProvide>(context)
          .saveAllCategoryTitleList(model.data[index].bxMallSubDto);
    }
  }

  _listData(BuildContext context,{Map<String, dynamic>params}) async {
    CategoryListModel model = await CategoryListRequestModel()
              .categoryListRequest(params: params);
      Provide.value<CategoryProvide>(context).saveCategoryListModel(model);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
    Map<String, String> parmas = Provide.value<CategoryProvide>(context).params;
    _listData(context, params: parmas);
    return Scaffold(
        appBar: AppBar(
          title: Text('分类'),
        ),
        body: Provide<CategoryProvide>(
          builder: (BuildContext context, Widget child,
              CategoryProvide categoryProvide) {
            categoryNavData = categoryProvide.categoryNavData;
            if (categoryNavData == null) {
              return Container(child: SpinKitWave(color: Colors.blue[200]));
            }

            leftIndex = categoryProvide.leftSelectedIndex;
            rightIndex = categoryProvide.rightSelectedIndex;
            categoryId =
                categoryProvide.categoryNavData[leftIndex].mallCategoryId;
            allBxMallSubDto = categoryProvide.allBxMallSubDto;
            categoryListData = categoryProvide.categoryListData;

            return Container(
              child: Row(
                children: <Widget>[
                  CategoryLeftNavPage(
                      categoryNavData: categoryNavData,
                      leftSelectedIndex: leftIndex,
                      rightSelectedIndex: rightIndex),
                  Column(
                    children: <Widget>[
                      CategoryTopNavPage(
                          allBxMallSubDto: allBxMallSubDto,
                          categoryId: categoryId,
                          rightSelectedIndex: rightIndex),
                      CategoryListPage(categoryListData ?? []),
                    ],
                  ),
                ],
              ),
            );
          },
        ));
  }
}
