import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lb_flutter_project/common_widget/BLTScaffoldWidget.dart';
import 'package:lb_flutter_project/common_widget/WidgetExtension/BLTWidgetExtensions.dart';
import 'package:lb_flutter_project/module/EnumConvert/entity/l_b_enum_convert_model_entity.dart';

import '../entity/l_b_convert_enum_entity2_entity.dart';
import '../entity/lb_original_convert_enum_entity.dart';
import 'l_b_enum_convert_page_logic.dart';


class LBEnumConvertPagePage extends StatelessWidget {
  LBEnumConvertPagePage({Key? key}) : super(key: key);

  final LBEnumConvertPageLogic logic = Get.put(LBEnumConvertPageLogic());

  @override
  Widget build(BuildContext context) {

    return BltScaffold(title: "枚举转换", child:
      ListView(
        children: [
          _buildList1(),
          _buildList2(),
          _buildList2(),
        ],
      )
    );
  }

  Widget _buildList1(){
    return Obx((){
      return ListView.builder(
          shrinkWrap: true,
          itemCount: logic.dataList.length,
          itemBuilder: (context, index){
            final item = logic.dataList[index];
            Color color = Colors.black;
            switch (item.colorType){
              case LBColorType.red:
                color = Colors.red;
              case LBColorType.blue:
                color = Colors.blue;
              case LBColorType.yellow:
                color = Colors.yellow;
            }
            return Text(
              """item name ${item.name} 
                    sex ${item.sexType} 
                    color ${item.colorType} 
                    payType ${item.payType} 
                    stringType ${item.stringType}""",
              style: TextStyle(color: color),
            ).intoPadding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10)
            );
          });
    });
  }

  Widget _buildList2(){
      return Obx((){
        return ListView.builder(
            shrinkWrap: true,
            itemCount: logic.dataList2.length,
            itemBuilder: (context, index){
              final item = logic.dataList2[index];
              Color color = Colors.black;
              switch (item.colorType){
                case LBColorType2.red:
                  color = Colors.red;
                case LBColorType2.blue:
                  color = Colors.blue;
                case LBColorType2.yellow:
                  color = Colors.yellow;
              }
              return Text(
                """item name ${item.name} 
                    sex ${item.sexType} 
                    color ${item.colorType} 
                    payType ${item.payType} 
                    stringType ${item.stringType}""",
                style: TextStyle(color: color),
              ).intoPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10)
              );
            });
      });
  }


  Widget _buildList3(){
    return Obx((){
      return ListView.builder(
          shrinkWrap: true,
          itemCount: logic.dataList3.length,
          itemBuilder: (context, index){
            final item = logic.dataList3[index];
            Color color = Colors.black;
            switch (item.colorType){
              case LBColorType3.red:
                color = Colors.red;
              case LBColorType3.blue:
                color = Colors.blue;
              case LBColorType3.yellow:
                color = Colors.yellow;
            }
            return Text(
              """item name ${item.name} 
                    sex ${item.sexType} 
                    color ${item.colorType} 
                    payType ${item.payType} 
                    stringType ${item.stringType}""",
              style: TextStyle(color: color),
            ).intoPadding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10)
            );
          });
    });
  }
}
