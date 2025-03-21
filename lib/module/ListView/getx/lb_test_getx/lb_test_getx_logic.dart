import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LbTestGetxLogic extends GetxController {

  var count = 0.obs;

  @override
  void onReady() {
    debugPrint("LBLog onReady ---------");
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void startTimer(){
    Timer.periodic(Duration(seconds: 2), (timer) {
      print("每2秒执行一次");
      count ++;
      // 停止定时器
      if (timer.tick >= 5) { // 运行5次后停止
        timer.cancel();
        print("定时器已停止");
      }
    });
  }

}
