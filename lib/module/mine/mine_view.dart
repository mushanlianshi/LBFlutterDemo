import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'mine_logic.dart';
import 'mine_state.dart';

class MinePage extends StatelessWidget {
  const MinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MineLogic logic = Get.put(MineLogic());
    final MineState state = Get.find<MineLogic>().state;

    return Container(color: Colors.amberAccent);
  }
}
