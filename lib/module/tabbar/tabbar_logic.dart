import 'package:get/get.dart';

import 'tabbar_state.dart';

class TabbarLogic extends GetxController {
  final TabbarState state = TabbarState();

  final currentIndex = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print("LBLog tabbar onInit");
  }
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    print("LBLog tabbar onReady");
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    print("LBLog tabbar onClose");
  }

  changeTabbarIndex(int index){
     currentIndex.value = index;
  }

}
