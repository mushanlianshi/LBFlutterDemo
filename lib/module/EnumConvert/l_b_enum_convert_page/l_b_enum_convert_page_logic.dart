import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lb_flutter_project/module/EnumConvert/entity/l_b_convert_enum_entity2_entity.dart';
import 'package:lb_flutter_project/module/EnumConvert/entity/l_b_enum_convert_model_entity.dart';
import 'package:lb_flutter_project/module/EnumConvert/entity/lb_original_convert_enum_entity.dart';


class LBEnumConvertPageLogic extends GetxController {

  final dataList = <LBEnumConvertModelEntity>[].obs;

  final dataList2 = <LBConvertEnumEntity2Entity>[].obs;

  final dataList3 = <LbOriginalConvertEnumEntity>[].obs;

  @override
  void onReady() {
    super.onReady();
    loadData();
  }

  void loadData() async{
    // 读取 JSON 文件
    String jsonString = await rootBundle.loadString('assets/File/enumConvert.json');
    print("LBLog jsonString is ${jsonString}");
    // 解析 JSON 数据
    List<dynamic> jsonList = jsonDecode(jsonString);

    var sex = LBSexType2.values.firstWhere((e) => e.value == 11, orElse: () => LBSexType2.female);
    print("LBLog sex is $sex");

    final list = jsonList.map((jsonItem) => LBEnumConvertModelEntity.fromJson(jsonItem)).toList();
    // for (var item in list) {
    //   print("LBLog item name is ${item.name}");
    //   print("LBLog item sexType is ${item.sexType}");
    //   print("LBLog item payType is ${item.payType}");
    //   print("LBLog item colorType is ${item.colorType}");
    // }
    dataList.addAll(list);

    final list2 = jsonList.map((jsonItem) => LBConvertEnumEntity2Entity.fromJson(jsonItem)).toList();
    // for (var item in list2) {
    //   print("LBLog item2 name is ${item.name}");
    //   print("LBLog item2 sexType is ${item.sexType}");
    //   print("LBLog item2 payType is ${item.payType}");
    //   print("LBLog item2 colorType is ${item.colorType}");
    // }
    dataList2.addAll(list2);

    final list3 = jsonList.map((jsonItem) => LbOriginalConvertEnumEntity.fromJson(jsonItem)).toList();
    // for (var item in list2) {
    //   print("LBLog item2 name is ${item.name}");
    //   print("LBLog item2 sexType is ${item.sexType}");
    //   print("LBLog item2 payType is ${item.payType}");
    //   print("LBLog item2 colorType is ${item.colorType}");
    // }
    dataList3.addAll(list3);
    // 返回 User 对象
    // return User.fromJson(jsonMap);

  }

}
