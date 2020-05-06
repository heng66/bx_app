import 'package:dio/dio.dart';
import 'dart:async';
import '../config/service_url.dart';

Future request(url, {paramsData}) async {
  try {
    Response response;
    Dio dio = new Dio();
    dio.options.contentType = Headers.formUrlEncodedContentType;

    if (paramsData == null) {
      response = await dio.post(servicePath[url]);
    } else {
      response = await dio.post(servicePath[url], data: paramsData);
    }

    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('服务器接口出现错误');
    }
  } catch (error) {
    return error;
  }
}
