import 'package:bx_app/model/category/category_nav_model.dart';
import 'package:bx_app/provide/categoryprovide/category_nav_provide.dart';
import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'pages/home_page.dart';
import 'pages/category_page.dart';
import 'pages/cart_page.dart';
import 'pages/member_page.dart';
import 'pages/index_page.dart';
import 'package:provide/provide.dart';
import 'provide/homecontent_provide.dart';
import 'provide/home_hot_list_provide.dart';
import 'provide/categoryprovide/category_list_provide.dart';

void main(List<String> args) {
  
  var contentProvide = HomeContentProvide();
  var hotlistProvide = HomeHotListProvide();
  var categoryNavProvide = CategoryNavProvide();
  var listProvide = CategoryListProvide();
  
  var provides = Providers();

  provides
  ..provide(Provider<HomeContentProvide>.value(contentProvide))
  ..provide(Provider<HomeHotListProvide>.value(hotlistProvide))
  ..provide(Provider<CategoryNavProvide>.value(categoryNavProvide))
  ..provide(Provider<CategoryListProvide>.value(listProvide));

  runApp(ProviderNode(child: MyApp(),providers: provides));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.pink),
        home: IndexPage(),
      )
    );
  }
}