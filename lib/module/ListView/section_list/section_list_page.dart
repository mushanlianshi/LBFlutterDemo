import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:get/get.dart';
import 'package:lb_flutter_project/common_widget/BLTScaffoldWidget.dart';

import 'section_list_logic.dart';
import 'section_list_state.dart';

// 类似iOS section 样式的
class SectionListPage extends StatelessWidget {
  const SectionListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("LBLOg SectionListPage ----");
    final SectionListLogic logic = Get.put(SectionListLogic());
    // final SectionListState state = Get.find<SectionListLogic>().state;
    return BltScaffold(
        title: "section 样式的listview",
        child: Obx((){
          return CustomScrollView(
            slivers: _buildSectionList(),
          );
        }));
  }

  List<Widget> _buildSectionList() {
    SectionListLogic logic = Get.find<SectionListLogic>();
    List<Widget> list = <Widget>[];
    logic.list.asMap().forEach((key, value) {
      String title = value.sectionTitle;
      SliverStickyHeader widget = SliverStickyHeader.builder(
        builder: (context, state) {
          return Container(
            child: Text(title,
                style: TextStyle(fontSize: 18, color: Colors.white)),
            color: Colors.blueGrey,
          );
        },
        sliver: SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return Container(
              child: Text(value.list[index]),
              color: Colors.white,
              height: 60,
              padding: EdgeInsets.symmetric(horizontal: 15),
            );

          },
            childCount: value.list.length,
          ),
        ),
      );
      list.add(widget);
    });
    return list;
  }
}
