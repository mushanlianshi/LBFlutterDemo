
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lb_flutter_project/common_widget/BLTScaffoldWidget.dart';

class LBHooksPage extends HookWidget {
  const LBHooksPage({super.key});



  // 用来管理stateless的声明周期
   _processLifeState(){
    // 使用 useEffect 来执行副作用
    useEffect(() {
      // 执行一些初始化操作，相当于 initState
      print("Widget Mounted");

      // 返回一个清理函数，相当于 dispose
      return () {
        print("Widget Disposed");
      };
    }, []);
  }


  @override
  Widget build(BuildContext context) {
     _processLifeState();
    // 关注：使用 useState
    final counter = useState(0);
     print("LBLog build ------");
    print("LBLog 执行时间：${DateTime.now()}  counter.value = ${counter.value}");
    return BltScaffold(
      floatingActionButton: FloatingActionButton(
        // 关注：使用 counter.value ++
        onPressed: () => counter.value++,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), title: 'hooks page',
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            // 关注：使用 counter.value
            Text("${counter.value}"),
          ],
        ),
      ),
    );
  }
}