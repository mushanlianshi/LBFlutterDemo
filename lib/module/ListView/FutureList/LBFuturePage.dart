
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lb_flutter_project/common_widget/BLTScaffoldWidget.dart';

class LBFuturePage extends StatefulWidget{
  const LBFuturePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LBFuturePageState();
  }
}

class _LBFuturePageState<LBFuturePage> extends State{
  int _count = 0;

  //耗时工作，计算偶数个数
  static Future<int> asyncCountEven(int num) async {
    print("LBLog ---- asyncCountEven ${num}");
    int count = 0;
    while (num > 0) {
      if (num % 2 == 0) {
        count++;
      }
      num--;
    }
    return count;
  }

  //模拟Future耗时 Future只是异步，还在当前UI线程，所以会卡顿
  void doMockTimeConsume() async {
    _count = await asyncCountEven(200000000);
    setState(() {});
  }

  /// Isolate 是dart并发的模式，相当于新的线程，但不是线程，资源隔离。所以不会卡顿
  void  doMockTimeConsumeByIsolate() async{
      _count = await compute(asyncCountEven, 300000000);
      setState(() {});
  }

  // main(List<String> args) async {
  //   int result = await compute(powerNum, 5);
  //   print(result);
  // }
  //
  // int powerNum(int num) {
  //   return num * num;
  // }

  @override
  Widget build(BuildContext context) {
    return BltScaffold(
        title: "future 卡顿的",
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 100,
                height: 100,
                child: CircularProgressIndicator(),
              ),
              Text(_count.toString()),
              TextButton(
                onPressed: () {
                  //触发耗时操作
                  doMockTimeConsume();
                },
                child: Text('开始耗时工作 卡顿的'),
              ),
              TextButton(
                onPressed: () {
                  //触发耗时操作
                  doMockTimeConsumeByIsolate();
                },
                child: Text('开始耗时工作 不卡顿的'),
              )
            ],
          ),
        )
    );
  }

}