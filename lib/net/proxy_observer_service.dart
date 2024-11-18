import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'http.dart';

class ProxyObserverService extends GetxService with WidgetsBindingObserver {
  @override
  void onInit() {
    super.onInit();
    if (Platform.isAndroid || Platform.isIOS) {
      WidgetsBinding.instance.addObserver(this);
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      resetHttpProxy();
    }
  }

  Future<void> resetHttpProxy() async {
    // String proxy = await BltPlugin.findProxy();
    // if (proxy.isNotEmpty) {
    //   Http().setProxy("PROXY $proxy");
    //   // print("设置代理 222 $proxy");
    // } else {
    //   Http().setProxy("DIRECT");
    //   // print("设置代理 222 DIRECT");
    // }
  }
}
