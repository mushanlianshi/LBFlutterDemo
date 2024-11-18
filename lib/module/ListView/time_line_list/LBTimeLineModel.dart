
import 'package:flutter/cupertino.dart';

/// 0是未到达， 1是高亮， 2使用图片1  3使用图片2
enum LBTimeLineStatus{
    normal,
    select,
    pictureOne,
    pictureTwo,
}

/// 时间轴的模型
class LBTimeLineModel{
  LBTimeLineStatus status = LBTimeLineStatus.normal;
  String title;
  String? content;
  String? btnText;
  GestureTapCallback? onTap;
  bool isLast;
  LBTimeLineModel(this.status, this.title, {this.isLast = false, this.content, this.btnText, this.onTap});
}