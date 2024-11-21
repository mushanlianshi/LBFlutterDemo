import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lb_flutter_project/common_widget/BLTScaffoldWidget.dart';
import 'package:lb_flutter_project/common_widget/WidgetExtension/BLTWidgetExtensions.dart';

class LBShowScrollIndicatorPage extends StatefulWidget {
  const LBShowScrollIndicatorPage({super.key});

  @override
  State<LBShowScrollIndicatorPage> createState() => _LBShowScrollIndicatorPageState();
}

class _LBShowScrollIndicatorPageState extends State<LBShowScrollIndicatorPage> {
  final ScrollController _firstController = ScrollController();

  @override
  Widget build(BuildContext context) {
      return BltScaffold(title: "scroll指示条",
          child: _buildScrollBarWidget(),
      );
  }
  
  
  _buildScrollBarWidget(){
    /// 使用LayoutBuilder 来根据父控件的尺寸来布局，仅当需要负空间尺寸的时候使用
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          print("LBLog constraints ${constraints}");
          return Row(
            children: <Widget>[
              SizedBox(
                  width: constraints.maxWidth / 2,
                  child: Scrollbar(
                    thumbVisibility: true,
                    controller: _firstController,
                    child: ListView.builder(
                        controller: _firstController,
                        itemCount: 100,
                        itemBuilder: (BuildContext context, int index) {
                          return LayoutBuilder(builder: (_, constraints){
                            print("LBLog  list item constraints ${constraints}");
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Scrollable 1 : Index $index'),
                              );
                          });
                        }),
                  )
              ),
              SizedBox(
                  width: constraints.maxWidth / 2,
                  child: Scrollbar(
                    thumbVisibility: true,
                    child: ListView.builder(
                        primary: true,
                        itemCount: 100,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                              height: 50,
                              color: index.isEven
                                  ? Colors.amberAccent
                                  : Colors.blueAccent,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Scrollable 2 : Index $index'),
                              ));
                        }),
                  )),
            ],
          );
        });
  }
}