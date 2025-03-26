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
    const customScrollModel1 = LBHomeListModel(title: "sectionList样式", router: LBRouter.sectionList);
    const customScrollModel2 = LBHomeListModel(title: "sectionList样式实现2", router: LBRouter.sectionList2);
    const localPluginModel = LBHomeListModel(title: "本地制作插件库", router: LBRouter.localPlugin);
    const progressModel = LBHomeListModel(title: "进度条", router: LBRouter.progressPar);
    const timeLineModel = LBHomeListModel(title: "时间轴", router: LBRouter.timeLineListPage);
    const buttonStyleModel = LBHomeListModel(title: "按钮样式", router: LBRouter.buttonStylePage);
    const scrollIndicator = LBHomeListModel(title: "显示scrollbar指示条", router: LBRouter.showScrollIndicatorPage);
    const contactList = LBHomeListModel(title: "通讯录", router: LBRouter.contactListPage);
    const alertModel = LBHomeListModel(title: "弹框", router: LBRouter.alertPage);
    const futureModel = LBHomeListModel(title: "future 和 Isolate", router: LBRouter.futurePage);
    const sliverDemo = LBHomeListModel(title: "sliver 各样列表的 demo", router: LBRouter.sliverDemoPage);
    const nestDemo = LBHomeListModel(title: "nest demo", router: LBRouter.nestDemoPage);
    const getxExtension = LBHomeListModel(title: "测试getx 扩展", router: LBRouter.testGetx);
    const hooksPage = LBHomeListModel(title: "hooks 测试", router: LBRouter.hooksPage);
    const gradientPage = LBHomeListModel(title: "渐变色", router: LBRouter.gradientPage);
    const enumConvertPage = LBHomeListModel(title: "枚举转换", router: LBRouter.convertEnum);

    dataList.addAll([
      customScrollModel1, customScrollModel2, localPluginModel, progressModel, timeLineModel,
      buttonStyleModel, scrollIndicator, contactList, alertModel, futureModel, sliverDemo, nestDemo,
      getxExtension, hooksPage, gradientPage, enumConvertPage
    ]);
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    print("LBLog onClose ----- ");
  }
}
