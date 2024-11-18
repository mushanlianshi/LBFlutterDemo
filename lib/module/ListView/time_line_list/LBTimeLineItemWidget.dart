import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lb_flutter_project/common_widget/WidgetExtension/BLTWidgetExtensions.dart';
import 'package:lb_flutter_project/module/ListView/time_line_list/LBDashBoxPainter.dart';
import 'package:lb_flutter_project/module/ListView/time_line_list/LBTimeLineModel.dart';
import 'package:lb_flutter_project/module/ListView/time_line_list/LBTimeLinePainter.dart';

class LBTimeLineItemWidget extends StatelessWidget {
  final LBTimeLineModel lbTimeLineModel;

  const LBTimeLineItemWidget({Key? key, required this.lbTimeLineModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// 用IntrinsicHeight来包裹， 返回实际高度，以免被拉高
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildDecoration(),
          SizedBox(width: 10),
          _rightWidget(),
        ],
      ).intoContainer(
        padding: EdgeInsets.only(left: 10),
      )
    );
  }

  _buildDecoration() {
    return Container(
      // margin: EdgeInsets.only(left: 20),
      width: 20,
      decoration: LBDashDecoration(
          lbTimeLineModel,
          circleColor: Colors.blue,
          circleRaduis: 10,
          lightLineColor: Colors.red,
          normalLineColor: Colors.grey,
          lineDashPatter: [5,2],
      ),
    );
  }

  _rightWidget() {
    return Container(
      padding: EdgeInsets.only(bottom: 15),
      /// 设置最小高度
      constraints: BoxConstraints(minHeight: 64),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(lbTimeLineModel.title, style: TextStyle(fontSize: 16)),
          SizedBox(height: 5),
          Text(
            lbTimeLineModel.content ?? "",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            maxLines: 10,
          ),
          SizedBox(height: 4),
          // TextButton(
          //   onPressed: () {},
          //   style: ButtonStyle(
          //     backgroundColor: MaterialStateProperty.all(Colors.blue),
          //     /// 按钮内间距
          //     padding: MaterialStateProperty.all(EdgeInsets.zero),
          //     ///
          //     minimumSize: MaterialStateProperty.all(Size.zero),
          //   ),
          //   child: Text('无内间距按钮'),
          // ).intoContainer(
          //   color: Colors.yellow,
          // ),
          Visibility(
            visible: lbTimeLineModel.btnText != null,
            child: TextButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 5, horizontal: 12)),
                minimumSize: MaterialStateProperty.all(Size.zero),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                side: MaterialStateProperty.all(
                    BorderSide(width: 1, color: Colors.orange)),
              ),
              onPressed: () {},
              child: Text(lbTimeLineModel.btnText ?? "",
                  style: TextStyle(fontSize: 14, color: Colors.amber)),
            ),
          )
        ],
      ),
    ).intoExpanded();
  }

  //读取 assets 中的图片
  Future<ui.Image>? loadImageFromAssets(String path) async {
    ByteData data = await rootBundle.load(path);
    return decodeImageFromList(data.buffer.asUint8List());
  }
}
