
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lb_flutter_project/common_widget/BLTScaffoldWidget.dart';
import 'package:lb_flutter_project/common_widget/WidgetExtension/BLTWidgetExtensions.dart';

/// 出去pading
// padding: MaterialStateProperty.all(EdgeInsets.zero),
// /// 去除最小的尺寸
// minimumSize: MaterialStateProperty.all(Size.zero),
// /// 去除点击最小的尺寸
// tapTargetSize: MaterialTapTargetSize.shrinkWrap,
class LBButtonStylePage extends StatelessWidget{
  const LBButtonStylePage({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
      return  BltScaffold(title: "按钮样式", child: Column(
        children: [
          _buildButtonWidget(),
          SizedBox(height: 10),
          _buildButtonWidget1(),
          SizedBox(height: 10),
          _buildButtonWidget2(),
          SizedBox(height: 10),
          _buildButtonWidget3(),
        ],
      ));
  }

  Widget _buildButtonWidget(){
      return TextButton(
          onPressed: (){
          },
          child: Text("默认的button"),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue),
          ),
      ).intoContainer(
        color: Colors.red,
      );
  }

  Widget _buildButtonWidget1(){
    return TextButton(
      onPressed: (){
      },
      child: Text("默认的button"),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.blue),
        padding: MaterialStateProperty.all(EdgeInsets.zero),
      ),
    ).intoContainer(
      color: Colors.red,
    );
  }

  Widget _buildButtonWidget2(){
    return TextButton(
      onPressed: (){
      },
      child: Text("默认的button"),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blue),
          padding: MaterialStateProperty.all(EdgeInsets.zero),
          /// 去除最小的尺寸
          minimumSize: MaterialStateProperty.all(Size.zero),
        )
    ).intoContainer(
      color: Colors.red,
    );
  }

  Widget _buildButtonWidget3(){
    return TextButton(
      onPressed: (){
      },
      child: Text("默认的button"),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blue),
          /// 出去pading
          padding: MaterialStateProperty.all(EdgeInsets.zero),
          /// 去除最小的尺寸
          minimumSize: MaterialStateProperty.all(Size.zero),
          /// 去除点击最小的尺寸
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        )
    ).intoContainer(
      color: Colors.red,
    );
  }

}