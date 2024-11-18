import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:lb_flutter_project/net/blt_http_overrides.dart';
import 'package:lb_flutter_project/net/common_params_interceptor.dart';
import 'package:lb_flutter_project/net/rest_client.dart';

class Http {
  static final Http _instance = Http._single();
  static const defaultBaseUrl = 'https://api.baletu.com/';

  ///待后面开发切换环境的
  static var webHost = 'http://m.baletu.com/';
  static var cdnHost =
      'https://cdn.baletoo.cn/';

  var _commonParamsInterceptor =
      CommonParamsInterceptor(baseUrl: defaultBaseUrl);
  var _proxy = "DIRECT"; //"PROXY 192.168.61.30:8888";
  late var _dio = Dio()
    ..httpClientAdapter = IOHttpClientAdapter()
    ..interceptors.add(_JsonConvertInterceptor(baseUrl: defaultBaseUrl))
    ..interceptors.add(_commonParamsInterceptor);
  static RestClient? _restClient;
  final BltHttpOverrides _httpOverrides = BltHttpOverrides();
  var _baseUrl = defaultBaseUrl;

  String get baseUrl => _baseUrl;

  final downloadDio = Dio()
    ..options.validateStatus = (status) {
      return true;
    };

  Http._single();

  factory Http() {
    return _instance;
  }

  void configNewBaseUrl(String baseUrl) {
    _baseUrl = baseUrl;
    final commonParams = _commonParamsInterceptor.commonParams;
    _commonParamsInterceptor = CommonParamsInterceptor(baseUrl: baseUrl);
    _commonParamsInterceptor.commonParams.addAll(commonParams);

    _dio = Dio()
      ..httpClientAdapter = IOHttpClientAdapter(
          createHttpClient: () => HttpClient()..findProxy = (uri) => _proxy)
      ..interceptors.add(_JsonConvertInterceptor(baseUrl: baseUrl))
      ..interceptors.add(_commonParamsInterceptor);

    _restClient = RestClient(_dio, baseUrl: baseUrl);
    RestClient(_dio, baseUrl: baseUrl);
  }

  void setCommonParams(String key, dynamic value) {
    _commonParamsInterceptor.commonParams[key] = value;
  }

  void removeCommonParams(String key) {
    _commonParamsInterceptor.commonParams.remove(key);
  }

  void setProxy(String proxy) {
    _proxy = proxy;
    _httpOverrides.updateProxy(proxy);
  }

  RestClient get client {
    if (_restClient == null) {
      HttpOverrides.global = _httpOverrides;
    }
    _restClient ??= RestClient(_dio, baseUrl: baseUrl);
    return _restClient!;
  }
}


RestClient get resetClient => Http().client;

class _JsonConvertInterceptor extends Interceptor {
  _JsonConvertInterceptor({required String baseUrl}) : _baseUrl = baseUrl;

  final String _baseUrl;

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    if (_isNeedFixResponse(_baseUrl, response)) {
      String originalData = response.data;
      final dataNext = originalData.length < 10 * 1024
          ? jsonDecode(response.data)
          : await compute(jsonDecode, originalData);

      final responseNext = Response(
        data: dataNext,
        requestOptions: response.requestOptions,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
        isRedirect: response.isRedirect,
        redirects: response.redirects,
        extra: response.extra,
        headers: response.headers,
      );
      handler.next(responseNext);
    } else {
      handler.next(response);
    }
  }

  bool _isNeedFixResponse(String baseUrl, Response<dynamic> response) {
    if (!response.requestOptions.uri.toString().startsWith(baseUrl)) {
      print('ignore ${response.requestOptions.uri}');
      return false;
    }
    print('ignore no ${response.requestOptions.uri}');
    int statusCode = response.statusCode ?? 0;
    if (statusCode >= 200 && statusCode < 300 && response.data is String) {
      String dataTrim = (response.data as String).trim();
      if (dataTrim.startsWith("{") && dataTrim.endsWith("}")) {
        return true;
      }
    }
    return false;
  }
}
