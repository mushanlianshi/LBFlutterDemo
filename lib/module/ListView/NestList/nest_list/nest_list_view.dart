import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lb_flutter_project/common_widget/BLTScaffoldWidget.dart';

import 'nest_list_logic.dart';

class NestListPage extends StatelessWidget {
  const NestListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NestListLogic logic = Get.put(NestListLogic());
    logic.resetDataSources();
    return BltScaffold(
        title: "sliver 样式的",
        child: Obx((){
          return ListView.builder(
              itemCount: logic.dataList.length,
              itemExtent: 44,
              itemBuilder: (context, index){
                final model = logic.dataList[index];
                return ListTile(
                  title: Text(model.title),
                  onTap: (){
                    Get.toNamed(model.router);
                  },
                );
              });
        })
    );
  }
}
