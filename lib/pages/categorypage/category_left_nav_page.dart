
import 'package:bx_app/model/category/category_list_model.dart';
import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bx_app/model/category/category_list_request_model.dart';
import 'package:bx_app/model/category/category_nav_model.dart';
import 'package:bx_app/model/category/category_nav_request_model.dart';
import 'package:bx_app/provide/category_provide.dart';

class CategoryLeftNavPage extends StatefulWidget {
  final int leftSelectedIndex;
  final int rightSelectedIndex;
  final List<CategoryNavData> categoryNavData;
  CategoryLeftNavPage({@required this.categoryNavData,@required this.leftSelectedIndex,@required this.rightSelectedIndex,Key key}) : super(key: key);

  @override
  _CategoryLeftNavPageState createState() => _CategoryLeftNavPageState();
}

class _CategoryLeftNavPageState extends State<CategoryLeftNavPage> {

  int selectedIndex;

  _listData(BuildContext context,{Map<String, dynamic>params}) async {
    CategoryListModel model = await CategoryListRequestModel()
              .categoryListRequest(params: params);
      Provide.value<CategoryProvide>(context).saveCategoryListModel(model);
  }

  Widget _leftNavWidget(List<CategoryNavData> categoryNavData, int index) {
    selectedIndex = widget.leftSelectedIndex;
    bool isSelected = (index == selectedIndex ? true : false);
    return InkWell(
        onTap: () {
          String categoryId = '';
          String categorySubId = '';
          categoryId = categoryNavData[index].mallCategoryId;
          String page = '1';
          Map<String, String> params = {
            'categoryId': categoryId,
            'categorySubId': categorySubId,
            'page': page
          };
          if (isSelected == false) {
            _listData(context, params: params);
            Provide.value<CategoryProvide>(context)
              .changeRightSelectedIndex(0);
          }else {
            Provide.value<CategoryProvide>(context).changeRightSelectedIndex(widget.rightSelectedIndex);
          }

          Provide.value<CategoryProvide>(context).changeLeftSelectedIndex(index);
          Provide.value<CategoryProvide>(context).saveAllCategoryTitleList(categoryNavData[index].bxMallSubDto);
        },
        child: Container(
          alignment: Alignment.center,
          height: ScreenUtil().setWidth(100),
          color: isSelected == true ? Colors.blue[100] : Colors.white,
          child: Text(
            categoryNavData[index].mallCategoryName,
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
        child: Container(
              decoration: BoxDecoration(
                  border: Border(
                      right: BorderSide(width: 1, color: Colors.black12))),
              child: ListView.builder(
                itemCount: widget.categoryNavData.length,
                itemBuilder: (BuildContext context, int index) {
                  return _leftNavWidget(widget.categoryNavData, index);
                },
              ),
            ),
        );
  }
}
