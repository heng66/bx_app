import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:convert';
import 'package:bx_app/common/url_utils.dart';

class Method {
  static final String get = "GET";
  static final String post = "POST";
  static final String put = "PUT";
  static final String head = "HEAD";
  static final String delete = "DELETE";
  static final String patch = "PATCH";
}

class NetWorkUtils {
  Dio _dio;
  Dio get dio => _dio;
  CancelToken cancelToken = CancelToken();

  NetWorkUtils(
      {String baseUrl: UrlUtils.Base_Url, Map<String, dynamic> header}) {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 5000,
      responseType: ResponseType.plain,
      headers: header ?? {'Content-Type': Headers.formUrlEncodedContentType},
    );
    _dio = Dio(options);
  }

  Future<Response> request(String path,
      {Map<String, dynamic> params,
      String method: 'POST',
      CancelToken cancelToken}) async {
    Response response;
    try {
      response = await dio.request(path,
          data: params != null ? FormData.fromMap(params) : null,
          queryParameters: params,
          options: Options(method: method),
          cancelToken: cancelToken);
    } catch (error) {
      return error;
    }
    return response;
  }

  void cancelRequest(CancelToken token) {
    token.cancel("the request was cancelled");
  }
}
