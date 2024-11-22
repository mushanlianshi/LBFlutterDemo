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
    print("LBLog ${ThemeData().scaffoldBackgroundColor}");
    // final SectionList2State state = Bind.find<SectionList2Logic>().state;
  // return _buildListWidget();
    return BltScaffold(title: "sectionList 2", child: _buildListWidget());
  }

  Widget _buildListWidget() {
    SectionList2Logic logic = Get.find<SectionList2Logic>();
    return Obx(() {
      return ListView.builder(
          itemCount: logic.list.length,
          itemBuilder: (_, index) {
            SectionListState state = logic.list[index];
            print("LBlog height is ${state.list.length * 50}");
            return StickyHeader(
              /// 使用LayoutBuilder 获取到屏幕的宽度
                header: LayoutBuilder(builder: (_, constraints){
                    return Container(
                      width: constraints.maxWidth,
                      color: Colors.lightBlue,
                      child: Text(state.sectionTitle,
                          style: TextStyle(fontSize: 16, color: Colors.black)),
                    );
                }),
                content: ListView.builder(
                  /// 设置listview不可滚动
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: state.list.length,
                    itemExtent: 50,
                    itemBuilder: (_, index) {
                      String text = state.list[index];
                      return Text(
                          text, style: TextStyle(fontSize: 14, color: Colors
                          .black)).intoContainer(color: Colors.grey);
                    }
                )
                //     .intoSizedBox(
                //   height:  state.list.length * 50,
                // )
            );
          });
    });
  }

}
