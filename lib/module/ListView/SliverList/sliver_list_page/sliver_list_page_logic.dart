// TODO Implement this library.import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:lb_flutter_project/common_widget/LBRouter.dart';
import 'package:lb_flutter_project/module/ListView/SliverList/sliver_list_page/sliver_list_page_state.dart';
import 'package:lb_flutter_project/module/home/home_state.dart';

class SliverListPageLogic extends GetxController {
  final SliverListPageState state = SliverListPageState();

  final dataList = <LBHomeListModel>[].obs;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  resetDataSources(){
    dataList.clear();
    final overlapModel = LBHomeListModel(title: "头部重叠效果的", router: LBRouter.overlapHeaderPage);
    final fillPageModel = LBHomeListModel(title: "SliverFillViewport 充满整个屏幕的", router: LBRouter.sliverFullPage);
    final customHeader = LBHomeListModel(title: "自定义顶部header效果的", router: LBRouter.customPinHeaderPage);
    final navigationBarAlpha = LBHomeListModel(title: "顶部导航栏渐变的22", router: LBRouter.navigationBarAlpha);
    dataList.addAll([
      overlapModel, fillPageModel, customHeader, navigationBarAlpha
    ]);
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
