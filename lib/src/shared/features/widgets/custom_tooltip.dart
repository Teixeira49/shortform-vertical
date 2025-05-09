import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/helpers/string_helpers.dart';

class CustomTooltip extends StatelessWidget {
  const CustomTooltip({
    required this.message,
    required this.child,
    this.padding,
    this.backgroundColor,
    this.textStyle,
    this.waitDuration,
    this.verticalOffset,
    this.preferBelow,
    super.key,
  });

  final String message;
  final Widget child;
  final EdgeInsets? padding;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final double? waitDuration;
  final double? verticalOffset;
  final bool? preferBelow;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: message,
      padding: padding ?? const EdgeInsets.all(8),
      textStyle: textStyle ??
          TextStyle(
              color: backgroundColor != null
                  ? StringHelpers.selectFontColor(backgroundColor!)
                  : Colors.white,),
      verticalOffset: verticalOffset ?? 0,
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.grey.withOpacity(0.95),
        borderRadius: BorderRadius.circular(12.5),
      ),
      preferBelow: preferBelow ?? false,
      waitDuration: Duration(
        milliseconds: (waitDuration ?? 1).toInt(),
      ),
      child: child,
    );
  }
}
