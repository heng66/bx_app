import 'package:flutter/material.dart';
import 'package:bx_app/pages/cart_page.dart';
import 'package:bx_app/pages/category_page.dart';
import 'package:bx_app/pages/home_page.dart';
import 'package:bx_app/pages/index_page.dart';
import 'package:bx_app/pages/member_page.dart';
import 'package:bx_app/provide/category_provide.dart';
import 'package:bx_app/provide/home_detail_provide.dart';
import 'package:bx_app/provide/homecontent_provide.dart';
import 'package:bx_app/routers/application.dart';
import 'package:bx_app/routers/routes.dart';
import 'package:fluro/fluro.dart';
import 'package:provide/provide.dart';

void main(List<String> args) {
  var contentProvide = HomeContentProvide();
  var categoryProvide = CategoryProvide();
  var homedetailProvide = HomeDetailProvide();

  var provides = Providers();

  provides
    ..provide(Provider<HomeContentProvide>.value(contentProvide))
    ..provide(Provider<CategoryProvide>.value(categoryProvide))
    ..provide(Provider<HomeDetailProvide>.value(homedetailProvide));

  runApp(ProviderNode(child: MyApp(), providers: provides));
}

class MyApp extends StatelessWidget {
  MyApp() {
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.pink),
      home: IndexPage(),
    ));
  }
}
