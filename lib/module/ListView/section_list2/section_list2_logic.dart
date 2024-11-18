import 'package:get/get.dart';
import 'package:lb_flutter_project/module/ListView/section_list/section_list_state.dart';

import 'section_list2_state.dart';

class SectionList2Logic extends GetxController {
  RxList<SectionListState> list = <SectionListState>[].obs;
  // RxList<SectionListState> list2 = RxList<SectionListState>();

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    const section1 = const SectionListState("section 1111", ["1", "2", "3", "4", "5"]);
    const section2 = const SectionListState("section 2222", ["111", "222", "333", "444", "555"]);
    const section3 = const SectionListState("section 3333", ["1---", "2---", "3---", "4---", "5---"]);
    const section4 = const SectionListState("section 444", ["1", "2", "3", "4", "5"]);
    list.addAll([section1, section2, section3, section4]);
  }

  @override
  void onClose() {
    super.onClose();
  }
}
