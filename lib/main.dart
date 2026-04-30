import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:lb_flutter_project/common_widget/LBRouter.dart';
import 'package:lb_flutter_project/module/ListView/alert/LBAlertPage.dart';
import 'package:lb_flutter_project/module/home/home_page.dart';
import 'package:lb_flutter_project/module/tabbar/tabbar_page.dart';
import 'package:retrofit/error_logger.dart';
import 'r.dart';

void main() {
  /// 捕获flutter中的异常， widget布局出错等异常信息
  FlutterError.onError = (details){
    print("LBLog  FlutterError.onError --------start ");
    print("${details}");
      if(kReleaseMode){

      }else{
        FlutterError.dumpErrorToConsole(details);
      }
    print("LBLog  FlutterError.onError -------- end");
  };

  // runZonedGuarded是Dart语言中的一个函数，用于捕获和处理异步代码中的异常。
  runZonedGuarded((){
    runApp(const MyApp());
  }, (error, stack) {
    debugPrintStack(stackTrace: stack, label: error.toString());
  });

}

// 先新建一个navigatorKey  navigatorKey.currentContext获取导航上下文。处理没有context弹框的问题
GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
// 创建单订阅 Stream（默认）
    final controller = StreamController<int>();

    var streams = controller.stream.asBroadcastStream();
    streams.listen((data){
      print('Listener 2 received: $data');
    });
    streams.listen((data){
      print('Listener 3 received: $data');
    });

    // 第一次订阅成功
    // controller.stream.listen((data) {
    //   print('Listener 1 received: $data');
    // });

    // 添加数据
    controller.add(1);
    controller.add(2);
    controller.close();


    //第二次订阅将抛异常（这是单订阅的特性）
    // controller.stream.listen((data) {
    //   print('Listener 2 received: $data');
    // });

    // Future.delayed(Duration(seconds: 3), (){
    //   SmartDialog.showToast("test smart toast context");
    // });

    return GetMaterialApp(
      navigatorKey: navigatorKey,
      title: 'LB Flutter Demo',
      /// child这个widge是最后要显示的widget 必须要在布局中，不然不展示界面了
      builder: (context, child){
        print("LBLog app context is  ${child}");
        // 通过TransitionBuilder.init静态方法来初始化一个TransitionBuilder ，然后用这个builder来调用
        final smartDialog = FlutterSmartDialog.init();
        final easyLoading = EasyLoading.init();
        /// 加入到builder方法里的控件，把跟widget挂载这些三方widget下，一层层嵌套都在布局中了都有上下文了，
        /// 不然不加到布局中的widget不会触发build方法，这样就可以得到在布局中的context上下文了
        /// 类似SmartDialog Easyloading都是这个原理用静态变量持有上下文，
        /// 这样就不需要显示传递context给dialog overlay了,
        /// 然后第三方在把这个app根widget当成自己的子widget挂载builder方法的返回值里
        final customWidget = LBTestWiget.init();
        /// 层级：LBTestWidget->rootwidget
        child = customWidget(context, child);
        /// 层级：smartDialog->LBTestWidget->rootwidget
        child = smartDialog(context, child);
        /// 层级：easyloading -> smartDialog->LBTestWidget->rootwidget
        child = easyLoading(context, child);
        // final alertPage = LBAlertPage();
        // 如果需要初始化多个 第三方plugin 可以这么写
        // child = easyload(context, child);
        // child = botToastBuilder(context, child);
        return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
            child: child,
        );
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: TabbarPage(),
      getPages: LBRouter.routePages,
    );
  }
}

