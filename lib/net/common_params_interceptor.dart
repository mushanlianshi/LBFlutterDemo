import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class CommonParamsInterceptor extends Interceptor {
  CommonParamsInterceptor({required this.baseUrl});

  final String baseUrl;
  final Map<String, dynamic> commonParams = {};

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (options.uri.toString().startsWith(baseUrl)) {
      late final RequestOptions optionsNext;
      if (options.method.toUpperCase() == "GET") {
        final queryParameters = Map<String, dynamic>.from(commonParams);
        queryParameters.addAll(options.queryParameters);
        optionsNext = options.copyWith(queryParameters: queryParameters);
      } else if (options.method.toUpperCase() == "POST") {
        if (options.contentType?.contains("json") == true) {
          late final Map<String, dynamic> originalBody;
          if (options.data.runtimeType.toString().startsWith("Map<") ||
              options.data.runtimeType.toString().startsWith("_Map<")) {
            originalBody = options.data;
          } else if (options.data is String) {
            originalBody = jsonDecode(options.data);
          } else {
            originalBody = options.data.toJson();
          }
          Map<String, dynamic> bodyNext =
              Map<String, dynamic>.from(commonParams);
          bodyNext.addAll(originalBody);
          optionsNext = options.copyWith(data: bodyNext);
        } else if (options.contentType == "application/x-www-form-urlencoded") {
          // debugPrint("rType=${options.data.runtimeType}");
          if (options.data.runtimeType.toString().startsWith("Map<") ||
              options.data.runtimeType.toString().startsWith("_Map<")) {
            Map<String, dynamic> bodyNext =
                Map<String, dynamic>.from(commonParams);
            bodyNext.addAll(options.data);
            optionsNext = options.copyWith(data: bodyNext);
          } else {
            final queryParameters = Map<String, dynamic>.from(commonParams);
            queryParameters.addAll(options.queryParameters);
            optionsNext = options.copyWith(queryParameters: queryParameters);
          }
        } else {
          final queryParameters = Map<String, dynamic>.from(commonParams);
          queryParameters.addAll(options.queryParameters);
          optionsNext = options.copyWith(queryParameters: queryParameters);
        }
      } else {
        optionsNext = options;
      }
      handler.next(optionsNext);
    } else {
      handler.next(options);
    }
  }
}
