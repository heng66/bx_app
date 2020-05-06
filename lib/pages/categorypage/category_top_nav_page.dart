
import 'package:bx_app/model/category/category_list_model.dart';
import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:bx_app/provide/category_provide.dart';
import 'package:bx_app/model/category/category_list_request_model.dart';
import '../../model/category/category_nav_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryTopNavPage extends StatefulWidget {
  final int rightSelectedIndex;
  final String categoryId;
  final List<BxMallSubDto> allBxMallSubDto;
  CategoryTopNavPage({Key key,@required this.allBxMallSubDto,@required this.categoryId,@required this.rightSelectedIndex}) : super(key: key);

  @override
  _CategoryTopNavPageState createState() => _CategoryTopNavPageState();
}

class _CategoryTopNavPageState extends State<CategoryTopNavPage> {  

  _listData(BuildContext context,{Map<String, dynamic>params}) async {
    CategoryListModel model = await CategoryListRequestModel()
              .categoryListRequest(params: params);
      Provide.value<CategoryProvide>(context).saveCategoryListModel(model);
  }

  var selectedIndex;
  Widget _topNavListViewWidget(List<BxMallSubDto> allBxMallSubDto, int index) {
    selectedIndex = widget.rightSelectedIndex;
    bool isSelected = (index == selectedIndex ? true : false);
    return InkWell(
        onTap: () {
          String categoryId = '';
          String categorySubId = '';
          categoryId = widget.categoryId;
          categoryId = widget.categoryId;
          categorySubId = allBxMallSubDto[index].mallSubId;
          String page = '1';
          Map<String, String> params = {
            'categoryId': categoryId,
            'categorySubId': categorySubId,
            'page': page
          };
          _listData(context, params: params);
          Provide.value<CategoryProvide>(context).listRequestParams(params);
          Provide.value<CategoryProvide>(context).changeRightSelectedIndex(index);
        },
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.fromLTRB(
              ScreenUtil().setWidth(20), 0, ScreenUtil().setWidth(10), 0),
          child: Text(
            allBxMallSubDto[index].mallSubName,
            style: TextStyle(
                color: isSelected == true ? Colors.red : Colors.black,
                fontSize: isSelected == true?ScreenUtil().setSp(32):ScreenUtil().setSp(28)),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(570),
      height: ScreenUtil().setWidth(100),
      alignment: Alignment.center,
      color: Colors.white,
      child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.allBxMallSubDto.length,
            itemBuilder: (BuildContext context, int index) {
              return _topNavListViewWidget(widget.allBxMallSubDto, index);
            },
          ),
    );
  }
}
