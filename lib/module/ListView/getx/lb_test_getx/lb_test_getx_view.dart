import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lb_flutter_project/common_widget/BLTScaffoldWidget.dart';
import 'package:lb_flutter_project/common_widget/WidgetExtension/BLTWidgetExtensions.dart';

import 'lb_test_getx_logic.dart';

class LbTestGetxPage extends StatelessWidget {
  const LbTestGetxPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LbTestGetxLogic logic = Get.put(LbTestGetxLogic());

    return BltScaffold(
        title: "测试getx",
        child: Column(
          children: [
            Obx(() => Text("count ${logic.count.value}")),
            Align(
              alignment: Alignment.center,
              child: Text('Hello, World!').intoObx(),
            ),
            Text("count into getx ${logic.count.value}").intoObx(),
          ],
        ));
  }
}
