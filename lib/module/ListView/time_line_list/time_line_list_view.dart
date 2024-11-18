import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lb_flutter_project/common_widget/BLTScaffoldWidget.dart';
import 'package:lb_flutter_project/common_widget/WidgetExtension/BLTWidgetExtensions.dart';
import 'package:lb_flutter_project/module/ListView/time_line_list/LBTimeLineItemWidget.dart';
import 'package:lb_flutter_project/module/ListView/time_line_list/LBTimeLineModel.dart';

import 'time_line_list_logic.dart';

class TimeLineListPage extends StatelessWidget {
  const TimeLineListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TimeLineListLogic logic = Get.put(TimeLineListLogic());
      return BltScaffold(title: "时间轴", child:
      Column(
        children: [
            LBTimeLineItemWidget(
                lbTimeLineModel: LBTimeLineModel(LBTimeLineStatus.select, "第一步"),
            ),
          LBTimeLineItemWidget(
            lbTimeLineModel: LBTimeLineModel(LBTimeLineStatus.select, "第2步"),
          ),
          LBTimeLineItemWidget(
            lbTimeLineModel: LBTimeLineModel(LBTimeLineStatus.normal, "第3步",
                content: "哈哈哈哈我饿hi为何分i五黑我饿哈佛未回复恶狠狠, 哈哈哈哈我饿hi为何分i五黑我饿哈佛未回复恶狠狠",
                btnText: "已解决", onTap: (){
                print("LBLog 已解决");
            }),
          )
        ],
      )
      );
  }
}
