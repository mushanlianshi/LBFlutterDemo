
import 'package:get/get.dart';
import 'package:lb_flutter_project/common_widget/LBRouter.dart';
import 'package:lb_flutter_project/module/ListView/button_style/LBButtonStylePage.dart';
import 'package:lb_flutter_project/module/ListView/local_plugin/local_plugin_view.dart';
import 'package:lb_flutter_project/module/ListView/progress/progress_bar/progress_bar_view.dart';
import 'package:lb_flutter_project/module/ListView/section_list/section_list_page.dart';
import 'package:lb_flutter_project/module/ListView/section_list2/section_list2_page.dart';
import 'package:lb_flutter_project/module/ListView/time_line_list/time_line_list_view.dart';
import 'package:lb_flutter_project/module/home/home_page.dart';
import 'package:lb_flutter_project/module/mine/mine_view.dart';
import 'package:lb_flutter_project/module/tabbar/tabbar_page.dart';

class LBRouter{
  static const String tabbar = "/tabbar";
  static const String home = "/home";
  static const String sectionList = "/sectionList";
  static const String sectionList2 = "/sectionList2";
  static const String localPlugin = "/localPlugin";
  static const String mine = "/mine";
  static const String progressPar = "/ProgressBarPage";
  static const String timeLineListPage = "/timeLineListPage";
  static const String buttonStylePage = "/buttonStylePage";

  static final routePages = [
    GetPage(name: LBRouter.tabbar, page: () => TabbarPage()),
    GetPage(name: LBRouter.home, page: () =>  HomePage()),
    GetPage(name: LBRouter.sectionList, page: () =>  const SectionListPage()),
    GetPage(name: LBRouter.sectionList2, page: () =>  const SectionListPage2()),
    GetPage(name: LBRouter.mine, page: () =>  const MinePage()),
    GetPage(name: LBRouter.localPlugin, page: () =>  const LocalPluginPage()),
    GetPage(name: LBRouter.progressPar, page: () =>  const ProgressBarPage()),
    GetPage(name: LBRouter.timeLineListPage, page: () =>  const TimeLineListPage()),
    GetPage(name: LBRouter.buttonStylePage, page: () =>  const LBButtonStylePage()),
  ];

}