
import 'package:get/get.dart';
import 'package:lb_flutter_project/module/EnumConvert/l_b_enum_convert_page/l_b_enum_convert_page_view.dart';
import 'package:lb_flutter_project/module/GradientPage/LBGradientPage.dart';
import 'package:lb_flutter_project/module/ListView/Hooks/LBHooksPage.dart';
import 'package:lb_flutter_project/module/ListView/NestList/nest_list/LBNestTabbarPage.dart';
import 'package:lb_flutter_project/module/ListView/NestList/nest_list/nest_list_view.dart';
import 'package:lb_flutter_project/module/ListView/SliverList/sliver_list_page/LBCustomSliverHeaderPage.dart';
import 'package:lb_flutter_project/module/ListView/SliverList/sliver_list_page/LBSliverFullPage.dart';
import 'package:lb_flutter_project/module/ListView/SliverList/sliver_list_page/LBSliverOverlapHeaderPage.dart';
import 'package:lb_flutter_project/module/ListView/SliverList/sliver_list_page/sliver_list_page_view.dart';
import 'package:lb_flutter_project/module/ListView/alert/LBAlertPage.dart';
import 'package:lb_flutter_project/module/ListView/alphaNavigationBar/LBNavigationAlphaBarPage.dart';
import 'package:lb_flutter_project/module/ListView/button_style/LBButtonStylePage.dart';
import 'package:lb_flutter_project/module/ListView/contact/contact_list/contact_list_view.dart';
import 'package:lb_flutter_project/module/ListView/getx/lb_test_getx/lb_test_getx_view.dart';
import 'package:lb_flutter_project/module/ListView/local_plugin/local_plugin_view.dart';
import 'package:lb_flutter_project/module/ListView/progress/progress_bar/progress_bar_view.dart';
import 'package:lb_flutter_project/module/ListView/section_list/section_list_page.dart';
import 'package:lb_flutter_project/module/ListView/section_list2/section_list2_page.dart';
import 'package:lb_flutter_project/module/ListView/showScrollIndicator/LBShowScrollIndicatorPage.dart';
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
  static const String showScrollIndicatorPage = "/showScrollIndicatorPage";
  static const String contactListPage = "/contactListPage";
  static const String alertPage = "/alertPage";
  static const String futurePage = "/futurePage";
  static const String overlapHeaderPage = "/overlapHeaderPage";
  static const String sliverDemoPage = "/sliverDemoPage";
  static const String sliverFullPage = "/sliverFullPage";
  static const String customPinHeaderPage = "/customPinHeaderPage";
  static const String nestDemoPage = "/nestDemoPage";
  static const String nestTabbarPage = "/nestTabbarPage";
  static const String navigationBarAlpha = "/navigationBarAlpha";
  static const String testGetx = "/testGetx";
  static const String hooksPage = "/hooksPage";
  static const String gradientPage = "/gradientPage";
  static const String convertEnum = "/convertEnum";

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
    GetPage(name: LBRouter.showScrollIndicatorPage, page: () =>  const LBShowScrollIndicatorPage()),
    GetPage(name: LBRouter.contactListPage, page: () =>  ContactListPage()),
    GetPage(name: LBRouter.alertPage, page: () => LBAlertPage()),
    GetPage(name: LBRouter.sliverDemoPage, page: () => const LBSliverDemoPage()),
    GetPage(name: LBRouter.overlapHeaderPage, page: () => const LBSliverOverlapHeaderPage()),
    GetPage(name: LBRouter.sliverFullPage, page: () => LBSliverFullPage()),
    GetPage(name: LBRouter.customPinHeaderPage, page: () => LBCustomSliverHeaderPage()),
    GetPage(name: LBRouter.nestDemoPage, page: () => const NestListPage()),
    GetPage(name: LBRouter.nestTabbarPage, page: () => LBNestTabbarPage()),
    GetPage(name: LBRouter.navigationBarAlpha, page: () => const LBNavigationAlphaBarPage()),
    GetPage(name: LBRouter.testGetx, page: () => const LbTestGetxPage()),
    GetPage(name: LBRouter.hooksPage, page: () => const LBHooksPage()),
    GetPage(name: LBRouter.gradientPage, page: () => LBGradientPage()),
    GetPage(name: LBRouter.convertEnum, page: () => LBEnumConvertPagePage()),
  ];

}