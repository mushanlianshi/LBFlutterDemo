import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lb_flutter_project/common_widget/BLTScaffoldWidget.dart';
import 'package:lb_flutter_project/common_widget/WidgetExtension/BLTWidgetExtensions.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import 'progress_bar_logic.dart';
import 'progress_bar_state.dart';

class ProgressBarPage extends StatelessWidget {
  const ProgressBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProgressBarLogic logic = Get.put(ProgressBarLogic());
    return BltScaffold(
        title: "进度条",
        child: Column(
          children: [
            _buildFirstProgressBar(),
            _buildSecondPorgressWidget()],
        ).intoPadding(padding: EdgeInsets.symmetric(horizontal: 15))
    );
  }

  /// 注意padding要设置
  _buildFirstProgressBar() {
    ProgressBarLogic logic = Get.find<ProgressBarLogic>();
    return Row(
      children: [
        Obx(() {
          return StepProgressIndicator(
            totalSteps: logic.totalStep,
            currentStep: logic.currentStep.value,
            size: 8,
            padding: 0,
            roundedEdges: Radius.circular(4),
            selectedColor: Colors.red,
            unselectedColor: Colors.grey,
          );
        }).intoExpanded(),
        SizedBox(width: 15),
        Obx((){
          return Text("进度：${logic.currentStep.value}",
              style: TextStyle(color: Colors.black));
        }),
      ],
    );
  }

  _buildSecondPorgressWidget() {
    ProgressBarLogic logic = Get.find<ProgressBarLogic>();
    return Stack(
      children: [
        Positioned(child: Obx(() {
          return CircularStepProgressIndicator(
            totalSteps: logic.totalStep,
            currentStep: logic.currentStep.value,
            selectedColor: Colors.greenAccent,
            unselectedColor: Colors.grey[200],
            padding: 0,
            width: 150,
            height: 150,
            roundedCap: (_, __) => true,
          );
        })),
        Positioned(
          left: 0, right: 0, bottom: 0, top: 0,
          child: Center(
              child: Obx((){
                return Text("进度： ${logic.currentStep.value}",
                  style: TextStyle(color: Colors.black),
                  textAlign: TextAlign.center,
                );
              }),
          ),
        )
      ],
    ).intoSizedBox(height: 150, width: 150);
  }
}
