import 'package:bx_app/provide/categoryprovide/category_list_provide.dart';
import 'package:flutter/material.dart';
import '../pages/categorypage/category_left_nav_page.dart';
import '../model/category/category_nav_request_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'categorypage/category_top_nav_page.dart';
import 'categorypage/category_list_page.dart';

class CategoryPage extends StatefulWidget {
  CategoryPage({Key key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  CategoryNavRequestModel requestModel = CategoryNavRequestModel();
  @override
  void initState() {
    requestModel.categoryNavRequest(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('分类'),
      ),
      body: Container(
        child: Row(
          children: <Widget>[
            CategoryLeftNavPage(),
            Column(
              children: <Widget>[
                CategoryTopNavPage(),
                CategoryListPage(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
