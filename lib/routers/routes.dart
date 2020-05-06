import 'package:flutter/material.dart';
import 'router_handler.dart';
import 'package:fluro/fluro.dart';

class Routes {
  static String root = '/';
  static String detailpage = '/detailpage';

  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return Text('route is not find !');
    });

    router.define(detailpage, handler: detailHandler);
  }
}
