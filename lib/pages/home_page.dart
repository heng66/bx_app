import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'homepage/home_banner_page.dart';
import 'homepage/home_ad_page.dart';
import 'homepage/home_shopmanager_phone_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'homepage/home_top_category_page.dart';
import 'homepage/home_recommend_page.dart';
import 'homepage/home_hot_list_page.dart';
import 'package:bx_app/model/home/home_hot_list_model.dart';
import 'package:bx_app/model/home/homecontent_model.dart';
import 'package:bx_app/pages/homepage/home_ad_page.dart';
import 'package:bx_app/pages/homepage/home_quality_goods_page.dart';
import 'package:bx_app/pages/homepage/home_shopmanager_phone_page.dart';
import 'package:bx_app/provide/homecontent_provide.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
//火爆专区 接口数据
import '../model/home/home_hot_list_request_model.dart';
//首页顶部列表推荐等等 接口数据
import '../model/home/home_content_request_model.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  HomeContentData contentData;
  var params = {'lon': '115.02932', 'lat': '35.76189'};

  @override
  void initState() {
    _getPageData(context,params);
    _getHomeHotGoodsData(context,1);
    super.initState();
  }

  _getPageData(BuildContext context, Map<String, dynamic> params) async {
    HomeContentModel model = await HomeContentRequestModel().homePageContentRequest(params: params);
    Provide.value<HomeContentProvide>(context).setHomeContentModel(model);
  }

  _getHomeHotGoodsData(BuildContext context, int page) async {
    HomeHotListModel model = await HomeHotListRequestModel().homeHotGoodsRequest(page: page);
    Provide.value<HomeContentProvide>(context).addHotList(model.data);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
    return Scaffold(
        appBar: AppBar(
          title: Text('首页'),
        ),
        body: Provide<HomeContentProvide>(
          builder: (BuildContext context, Widget child,
              HomeContentProvide contentProvide) {
                contentData = contentProvide.contentData;
            if (contentData == null) {
              return Container(
                child:SpinKitWave(color: Colors.blue[200])
              );
            } else {
              return Container(
                child: ListView(
                  children: <Widget>[
                    HomeBannerPage(contentData),
                    HomeTopCategoryPage(contentData),
                    HomeAdPage(contentData),
                    HomeShopManagerPhonePage(contentData),
                    HomeRecommendPage(contentData),
                    HomeQualityGoodsPage(contentData),
                    contentProvide.hotList.length > 0?HomeHotListPage(contentProvide.hotList):HomeHotListPage([]),
                  ],
                ),
              );
            }
          },
        ));
  }
}
