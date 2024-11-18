import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lb_flutter_project/common_widget/BLTScaffoldWidget.dart';
import 'package:lb_flutter_project/common_widget/WidgetExtension/BLTWidgetExtensions.dart';
import 'package:lb_flutter_project/module/ListView/section_list/section_list_state.dart';
import 'package:sticky_headers/sticky_headers.dart';

import 'section_list2_logic.dart';
import 'section_list2_state.dart';

class SectionListPage2 extends StatelessWidget {
  const SectionListPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SectionList2Logic logic = Get.put(SectionList2Logic());
    // final SectionList2State state = Bind.find<SectionList2Logic>().state;

    return BltScaffold(title: "sectionList 2", child: _buildListWidget());
  }

  Widget _buildListWidget() {
    SectionList2Logic logic = Get.find<SectionList2Logic>();
    return Obx(() {
      return ListView.builder(
          itemCount: logic.list.length,
          itemBuilder: (_, index) {
            SectionListState state = logic.list[index];
            return StickyHeader(
                header: Container(
                  color: Colors.lightBlue,
                  child: Text(state.sectionTitle,
                      style: TextStyle(fontSize: 16, color: Colors.black)),
                ),
                content: ListView.builder(
                    itemBuilder: (_, index) {
                      String text = state.list[index];
                      return Container(
                          height: 50,
                          color: Colors.white,
                          child: Text(
                            text, style: TextStyle(fontSize: 14, color: Colors
                              .black),)
                      ).intoSizedBox(
                         height: state.list.length * 50,
                      );
                    }
                )
            );
          });
    });
  }

}
