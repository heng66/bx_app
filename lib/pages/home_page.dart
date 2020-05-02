import 'package:bx_app/model/home/homecontent_model.dart';
import 'package:bx_app/pages/homepage/home_ad_page.dart';
import 'package:bx_app/pages/homepage/home_quality_goods_page.dart';
import 'package:bx_app/pages/homepage/home_shopmanager_phone_page.dart';
import 'package:flutter/material.dart';
import 'homepage/home_banner_page.dart';
import 'homepage/home_ad_page.dart';
import 'homepage/home_shopmanager_phone_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'homepage/home_top_category_page.dart';
import 'homepage/home_recommend_page.dart';
import 'homepage/home_hot_list_page.dart';
//火爆专区 接口数据
import '../model/home/home_hot_list_request_model.dart';
//首页顶部列表推荐等等 接口数据
import '../model/home/home_content_request_model.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin{

  HomeHotListRequestModel model = HomeHotListRequestModel();
  HomeContentRequestModel contentRequestModel = HomeContentRequestModel();
  
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    contentRequestModel.homePageContentRequest(context);
    model.getHotGoodsInfor(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            HomeBannerPage(),
            HomeTopCategoryPage(),
            HomeAdPage(),
            HomeShopManagerPhonePage(),
            HomeRecommendPage(),
            HomeQualityGoodsPage(),
            HomeHotListPage()
          ],
        ),
      ),
    );
  }
}
