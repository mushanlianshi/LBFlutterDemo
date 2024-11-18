import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_logic.dart';
import 'home_state.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final HomeLogic _logic = HomeLogic();

  @override
  Widget build(BuildContext context) {
    Get.put(_logic);
    _logic.resetDataSources();
    print("LBLog HomePage build ----- ");
    return Container(
      color: Colors.white,
      child: Obx((){
        return ListView.builder(
            itemCount: _logic.dataList.length,
            itemBuilder: (context, index){
              var model = _logic.dataList[index];
              return ListTile(
                title: Text(model.title),
                onTap: (){
                  Get.toNamed(model.router);
                },
              );
            });
      }),
    );
  }
}
