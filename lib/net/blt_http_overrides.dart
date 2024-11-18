import 'dart:io';

import 'package:flutter/cupertino.dart';

class BltHttpOverrides extends HttpOverrides {
  var _proxy = "DIRECT";

  @override
  HttpClient createHttpClient(SecurityContext? context) {
    debugPrint(_proxy);
    HttpClient httpClient = super.createHttpClient(context);
    return httpClient..findProxy = (uri) => _proxy;
  }

  void updateProxy(String proxy) {
    _proxy = proxy;
  }
}
