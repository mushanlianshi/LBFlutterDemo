import 'package:get/get.dart';
import 'package:lb_flutter_project/common_widget/LBRouter.dart';

import 'home_state.dart';

class HomeLogic extends GetxController {
  final dataList = <LBHomeListModel>[].obs;

  @override
  void onReady() {
    print("LBLog onReady ----- ");
    // TODO: implement onReady
    super.onReady();
    resetDataSources();
  }

  resetDataSources(){
    dataList.clear();
    final customScrollModel1 = LBHomeListModel(title: "sectionList样式", router: LBRouter.sectionList);
    final customScrollModel2 = LBHomeListModel(title: "sectionList样式实现2", router: LBRouter.sectionList2);
    final localPluginModel = LBHomeListModel(title: "本地制作插件库", router: LBRouter.localPlugin);
    final progressModel = LBHomeListModel(title: "进度条", router: LBRouter.progressPar);
    final timeLineModel = LBHomeListModel(title: "时间轴", router: LBRouter.timeLineListPage);
    final buttonStyleModel = LBHomeListModel(title: "按钮样式", router: LBRouter.buttonStylePage);
    dataList.addAll([
      customScrollModel1, customScrollModel2, localPluginModel, progressModel, timeLineModel,
      buttonStyleModel,
    ]);
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    print("LBLog onClose ----- ");
  }
}