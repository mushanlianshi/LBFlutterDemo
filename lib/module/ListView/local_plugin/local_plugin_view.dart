import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lb_flutter_project/common_widget/BLTScaffoldWidget.dart';
import 'package:lb_flutter_project/common_widget/WidgetExtension/BLTWidgetExtensions.dart';

import 'local_plugin_logic.dart';

class LocalPluginPage extends StatelessWidget {
  const LocalPluginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LocalPluginLogic logic = Get.put(LocalPluginLogic());
    logic.refreshPluginValue();
    logic.listEventChannel();
    print("LBLog LocalPluginPage build -------");
      return BltScaffold(
          title: "自己制作plugin",
          child: Obx((){
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("姓名：" + logic.nameObs.value, style: TextStyle(fontSize: 14, color: Colors.black)),
                Text("版本号：" + logic.versionObs.value, style: TextStyle(fontSize: 14, color: Colors.black)),
                Text("是否支持相机" + (logic.isAvaliableObs.value ? "是" : "否"), style: TextStyle(fontSize: 14, color: Colors.black)),
                Text("接收到eventChannel: " + logic.electronicObs.value, style: TextStyle(fontSize: 14, color: Colors.black)),
                Text("接收到eventChannel2: " + logic.electronic22Obs.value, style: TextStyle(fontSize: 14, color: Colors.black)),
              ],
            ).intoContainer(
              padding: EdgeInsets.symmetric(horizontal: 15),
            );
          }),
      );
  }
}
