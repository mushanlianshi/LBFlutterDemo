import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lb_flutter_project/common_widget/BLTScaffoldWidget.dart';
import 'package:lb_flutter_project/module/home/home_page.dart';
import 'package:lb_flutter_project/module/mine/mine_view.dart';

import 'tabbar_logic.dart';

class TabbarPage extends StatelessWidget {
  final _pageList = <Widget>[HomePage(), MinePage()];
  final _iconList = <Widget>[
    const Icon(Icons.home_filled, color: Colors.black),
    const Icon(Icons.person, color: Colors.black)
  ];
  final _iconSelectList = <Widget>[
    const Icon(Icons.home_filled, color: Colors.red),
    const Icon(Icons.person, color: Colors.red)
  ];
  final _titleList = <String>["首页", "我的"];
  /// 用来控制切换tab的
  late final  PageController _pageController;
  TabbarPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TabbarLogic logic = Get.put(TabbarLogic());
    var tabbarIndex = 0;
    if (Get.arguments != null){
      var index = Get.arguments["currentIndex"];
      if(index != null && index is int){
        logic.currentIndex.value = index;
        tabbarIndex = index;
      }
    }
    _pageController = PageController(initialPage:tabbarIndex);
    return BltScaffold(
      title: "tabbar",
      bottomNavigationBar: _buildBottomTabbarWidget(),
      child: PageView.builder(
          itemCount: _pageList.length,
          controller: _pageController,
          itemBuilder: (context, index) {
            return _pageList[index];
          }),
    );
  }

  _buildBottomTabbarWidget() {
    //surfaceTintColor同时设置才有效
    return BottomAppBar(
      color: Colors.white,
      surfaceTintColor: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _buildTabbarItemWidget(),
      ),
    );
  }

  List<Widget> _buildTabbarItemWidget() {
    final TabbarLogic logic = Get.put(TabbarLogic());
    var widgetList = <Widget>[];
    _titleList.asMap().forEach((index, title) {
      final icon = _iconList[index];
      final selectIcon = _iconSelectList[index];
      final widget = TextButton(
          onPressed: () {
            _chageTabbarIndex(index);
          },
          style: ButtonStyle(
              padding: MaterialStateProperty.all(EdgeInsets.zero),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() {
                return logic.currentIndex.value == index ? selectIcon : icon;
              }),
              SizedBox(height: 5),
              Obx(() => Text(title, style: TextStyle(color: logic.currentIndex.value == index ? Colors.red : Colors.black))),
            ],
          ));
      widgetList.add(widget);
    });
    return widgetList;
  }

  _chageTabbarIndex(int index){
    final TabbarLogic logic = Get.put(TabbarLogic());
    _pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    logic.changeTabbarIndex(index);
  }


}
