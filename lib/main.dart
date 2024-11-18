import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lb_flutter_project/common_widget/LBRouter.dart';
import 'package:lb_flutter_project/module/tabbar/tabbar_page.dart';
import 'package:retrofit/error_logger.dart';
import 'r.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ParseErrorLogger;
    return GetMaterialApp(
      title: 'LB Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: TabbarPage(),
      getPages: LBRouter.routePages,
    );
  }
}

