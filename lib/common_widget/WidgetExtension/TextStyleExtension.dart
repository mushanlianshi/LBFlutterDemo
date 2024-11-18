
import 'dart:ui';

import 'package:flutter/material.dart';

/// 不能添加类方法
extension TextStyle_Extension on TextStyle{
    ///段标题的样式
    TextStyle sectionHeaderTitleStyle({Color color = Colors.black, double fontSize = 16}){
        return TextStyle(color: color, fontWeight: FontWeight.w700, fontSize: fontSize);
    }

}