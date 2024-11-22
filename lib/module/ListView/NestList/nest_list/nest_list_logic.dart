import 'package:get/get.dart';
import 'package:lb_flutter_project/common_widget/LBRouter.dart';
import 'package:lb_flutter_project/module/home/home_state.dart';

class NestListLogic extends GetxController {

  final dataList = <LBHomeListModel>[].obs;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  resetDataSources(){
    dataList.clear();
    final tabbarModel = LBHomeListModel(title: "嵌套tabbar的", router: LBRouter.nestTabbarPage);
    dataList.addAll([
      tabbarModel,
    ]);
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
