import 'package:flutter/material.dart';

class XlmButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool? disabled;
  final Color textColor;
  final Color backgroundColor;
  final Color disabledBackgroundColor;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final Color shadowColor;
  final double elevation;
  final double fontSize;
  final FontWeight? fontWeight;
  final Size? minimumSize;
  final Gradient? gradient;

  const XlmButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.disabled,
    this.backgroundColor = Colors.redAccent,
    this.disabledBackgroundColor = Colors.black12,
    this.textColor = Colors.white,
    this.padding = const EdgeInsets.symmetric(horizontal: 12),
    this.borderRadius = 4,
    this.shadowColor = Colors.transparent,
    this.elevation = 0,
    this.fontSize = 12,
    this.fontWeight,
    this.minimumSize,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    Color bg = disabled == true
        ? disabledBackgroundColor
        : (gradient == null ? backgroundColor : Colors.transparent);
    Widget widget = ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: bg,
        foregroundColor: textColor,
        padding: padding,
        minimumSize: minimumSize,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        shadowColor: Colors.transparent,
        // elevation: elevation,
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
      ),
    );

    if (disabled == true) {
      return widget;
      return IntrinsicHeight(
        child: widget,
      );
    }

    // 渐变背景
    if (gradient != null) {
      widget = IntrinsicHeight(
        child: DecoratedBox(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              gradient: gradient),
          child: widget,
        ),
      );
    }
    return IntrinsicHeight(
      child: widget,
    );
  }
}
