import 'dart:ui' as ui;

// import 'package:flutter/cupertino.dart';
import 'package:lb_flutter_project/module/ListView/time_line_list/LBDashLine.dart';
import 'package:lb_flutter_project/module/ListView/time_line_list/LBTimeLineModel.dart';
import 'package:lb_flutter_project/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// 自定义container的装饰试图 自己画时间轴的
class LBDashDecoration extends Decoration {
  /// 耦合了业务模型， 可以后面优化掉
  final LBTimeLineModel model;
  final Color circleColor;
  final double circleRaduis;
  final Color lightLineColor;
  final Color normalLineColor;
  final double lineWidth;
  /// 间隔的
  final List<double> lineDashPatter;

  LBDashDecoration(
    this.model, {
    required this.circleColor,
    required this.circleRaduis,
    required this.lightLineColor,
    required this.normalLineColor,
        this.lineWidth = 2,
        required this.lineDashPatter,
  });

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return LBDashBoxPainter(this);
  }
}


/// 自定义painter来左边的时间轴
class LBDashBoxPainter extends BoxPainter {
    final LBDashDecoration decoration;
    LBDashBoxPainter(this.decoration);

    ///Offset 表示左上角的位置，configuration.size是可以拿到对应的控件大小的
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) async{
      final color = decoration.model.status == LBTimeLineStatus.normal ? decoration.normalLineColor : decoration.lightLineColor;
      /// 如果不是最后一个 画下面的线
      if (!decoration.model.isLast){
        final Paint paint = Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1
          ..color = color;

        canvas.translate(0, 0);
        double lineHeight = decoration.lineDashPatter[0];
        double margin = decoration.lineDashPatter[1];
        /// 记录划线偏移多少了
        double offsetY = decoration.circleRaduis * 2;
        /// 开始划线 还在高度内接着画
        while( offsetY < configuration.size!.height - 1){
          print("LBLog paint offsetY ===== ${offsetY}");
            canvas.drawLine(
                Offset(decoration.circleRaduis + offset.dx, offsetY + offset.dy),
                Offset(decoration.circleRaduis + offset.dx, offsetY + lineHeight + offset.dy),
                paint);
            offsetY += lineHeight + margin;

        }
      }


      /// 画图
      if(decoration.model.status == LBTimeLineStatus.pictureOne){
          canvas.translate(0, 0);
          // ui.Image image = Image.asset(R.assetsImageBaomihua);
          // canvas.drawImage(image, offset, circlePaint);
      }else{
        /// 画圆点
        final circlePaint = Paint()
          ..color = decoration.circleColor
          ..style = PaintingStyle.fill
          ..strokeWidth = 5;
        print("LBLog paint circle ===== ${decoration.circleRaduis}");
        /// 画圆， 需要加上偏移量
        canvas.drawCircle(
            Offset(offset.dx + decoration.circleRaduis, offset.dy + decoration.circleRaduis),
            decoration.circleRaduis,
            circlePaint
        );
      }
      // canvas.restore();
  }



}
