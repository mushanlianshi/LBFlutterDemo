import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lb_flutter_project/common_widget/LBRouter.dart';

import 'home_logic.dart';

class StaticClassProxy{
  static BuildContext? context;
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final HomeLogic _logic = HomeLogic();

  @override
  Widget build(BuildContext context) {
    Get.put(_logic);
    _logic.resetDataSources();
    return Container(
      color: Colors.white,
      child: Obx((){
        return ListView.builder(
            itemCount: _logic.dataList.length,
            itemBuilder: (context, index){
              var model = _logic.dataList[index];
              Widget child = Text(model.title);
              return ListTile(
                title: child,
                onTap: (){
                  if(model.router == LBRouter.alertPage){
                    print("LBLog LBTestWidget build ${identityHashCode(StaticClassProxy.context)}");
                    Get.toNamed(model.router, arguments: {"context" : StaticClassProxy.context});
                  }else{
                    Get.toNamed(model.router);
                  }
                },
              );
            });
      }),
    );
  }
}

/// 测试随便用一个widget的context是不是就可以弹框，哪怕这个widget不展示
class LBTestWiget extends StatefulWidget{

  final Widget? child;

  const LBTestWiget({Key? key, required this.child}) : super(key: key);

  static TransitionBuilder init() {
      return (BuildContext context, Widget? widget){
         return LBTestWiget(child: widget);
      };
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LBTestWigetState();
  }
}

class _LBTestWigetState extends State<LBTestWiget>{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  /// 加入到GetMaterialApp中， GetMaterialApp builder里的方法会触发Widget的State方法里的build方法
  /// (因为我们把rootWidget挂载在此widget下了， 此weiget出现在布局中了，成为了跟布局的父widget)，
  /// 不然widget不加入到布局中不会触发build方法重绘， 这样就可以得到在布局中的context上下文了，
  /// 在用一个静态变量保存这个上下文， 后面弹框showDialog或则overlay 都不需要显示传递context了
  /// SmartDialog或则EasyLoading就是这样做的
  @override
  Widget build(BuildContext context) {
    print("LBLog LBTestWidget build ${identityHashCode(context)}");
    print("LBLog LBTestWidget child ${widget.child}");
    StaticClassProxy.context = context;
    // Material(color: Colors.transparent, child: child)
    return Material(
        child: Overlay(
          initialEntries: [
            OverlayEntry(
              builder: (BuildContext context) {
                if (widget.child != null) {
                  return widget.child!;
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
    );
    return widget.child ?? Container();
  }

}
