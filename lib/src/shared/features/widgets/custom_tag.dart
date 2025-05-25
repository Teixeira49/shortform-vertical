import 'package:flutter/material.dart';

import '../../../theme/extended_text_theme.dart';
import '../../../variables/values/values.dart';

/// {@template custom_tag}
/// This widget displays a tag. Usually used for status indicators.
///
/// This class has custom constructors for the most common colors.
///
/// ![](https://i.imgur.com/hIW3akM.png)
/// ##### *Example of a [CustomTag.green] widget with a row of [Icon] and [Text] as a child.*
///
/// Parameters
/// ---
/// The [child] parameter is the main content of the tag. It is usually a [Text]
/// widget.
///
/// The [backgroundColor] parameter is the background color of the tag.
///
/// The [foregroundColor] parameter changes the color of the [child] widget.
///
/// The [border] parameter is the border of the tag. It defaults to `null`.
///
/// The optional [padding] parameter overrides the default padding for [CustomTag].
///
/// The [iconColor] parameter changes the color of the [Icon] widget.
///
/// {@endtemplate}
class CustomTag extends StatelessWidget {
  /// {@macro custom_tag}
  const CustomTag({
    super.key,
    required this.child,
    required this.backgroundColor,
    required this.foregroundColor,
    this.padding,
    this.iconColor,
  });

  final Widget child;
  final EdgeInsets? padding;
  final Color? iconColor;
  final Color backgroundColor;
  final Color foregroundColor;

  // factory CustomTag.primaryOne({
  //   required Widget child,
  //   EdgeInsets? padding,
  // }) {
  //   return CustomTag(
  //     border: Border.all(
  //       color: Consts.primaryOne.shade200,
  //       width: 1,
  //     ),
  //     backgroundColor: Consts.primaryOne.shade50,
  //     foregroundColor: Consts.primaryOne.shade500,
  //     iconColor: Consts.primaryOne.shade500,
  //     padding: padding,
  //     child: child,
  //   );
  // }

  factory CustomTag.primaryTwo({
    required BuildContext context,
    required Widget child,
    EdgeInsets? padding,
  }) {
    return CustomTag(
      backgroundColor: ColorValues.utilitySuccess50(context),
      foregroundColor: ColorValues.utilitySuccess900(context),
      iconColor: ColorValues.utilitySuccess900(context),
      padding: padding,
      child: child,
    );
  }

  // factory CustomTag.grey({
  //   required Widget child,
  //   EdgeInsets? padding,
  // }) {
  //   return CustomTag(
  //     border: Border.all(
  //       color: Consts.neutral.shade200,
  //       width: 1,
  //     ),
  //     backgroundColor: Consts.neutral.shade50,
  //     foregroundColor: Consts.neutral.shade500,
  //     iconColor: Consts.neutral.shade500,
  //     padding: padding,
  //     child: child,
  //   );
  // }

  factory CustomTag.success({
    required BuildContext context,
    required Widget child,
    EdgeInsets? padding,
  }) {
    return CustomTag(
      backgroundColor: ColorValues.utilitySuccess50(context),
      foregroundColor: ColorValues.utilitySuccess600(context),
      iconColor: ColorValues.utilitySuccess600(context),
      padding: padding,
      child: child,
    );
  }

  factory CustomTag.green({
    required BuildContext context,
    required Widget child,
    EdgeInsets? padding,
  }) {
    return CustomTag(
      backgroundColor: ColorValues.tagGreenBg(context),
      foregroundColor: ColorValues.tagGreenFg(context),
      iconColor: ColorValues.utilitySuccess600(context),
      padding: padding,
      child: child,
    );
  }

  factory CustomTag.blue({
    required BuildContext context,
    required Widget child,
    EdgeInsets? padding,
  }) {
    return CustomTag(
      backgroundColor: ColorValues.tagBlueBg(context),
      foregroundColor: ColorValues.tagBlueFg(context),
      iconColor: ColorValues.utilitySuccess600(context),
      padding: padding,
      child: child,
    );
  }

  factory CustomTag.red({
    required BuildContext context,
    required Widget child,
    EdgeInsets? padding,
  }) {
    return CustomTag(
      backgroundColor: ColorValues.tagRedBg(context),
      foregroundColor: ColorValues.tagRedFg(context),
      iconColor: ColorValues.utilitySuccess600(context),
      padding: padding,
      child: child,
    );
  }

  factory CustomTag.yellow({
    required BuildContext context,
    required Widget child,
    EdgeInsets? padding,
  }) {
    return CustomTag(
      backgroundColor: ColorValues.tagYellowBg(context),
      foregroundColor: ColorValues.tagYellowFg(context),
      iconColor: ColorValues.utilitySuccess600(context),
      padding: padding,
      child: child,
    );
  }

  factory CustomTag.orange({
    required BuildContext context,
    required Widget child,
    EdgeInsets? padding,
  }) {
    return CustomTag(
      backgroundColor: ColorValues.tagOrangeBg(context),
      foregroundColor: ColorValues.tagOrangeFg(context),
      iconColor: ColorValues.utilitySuccess600(context),
      padding: padding,
      child: child,
    );
  }

  factory CustomTag.pink({
    required BuildContext context,
    required Widget child,
    EdgeInsets? padding,
  }) {
    return CustomTag(
      backgroundColor: ColorValues.tagPinkBg(context),
      foregroundColor: ColorValues.tagPinkFg(context),
      iconColor: ColorValues.utilitySuccess600(context),
      padding: padding,
      child: child,
    );
  }

  factory CustomTag.purple({
    required BuildContext context,
    required Widget child,
    EdgeInsets? padding,
  }) {
    return CustomTag(
      backgroundColor: ColorValues.tagPurpleBg(context),
      foregroundColor: ColorValues.tagPurpleFg(context),
      iconColor: ColorValues.utilitySuccess600(context),
      padding: padding,
      child: child,
    );
  }

  factory CustomTag.brand({
    required BuildContext context,
    required Widget child,
    EdgeInsets? padding,
  }) {
    return CustomTag(
      backgroundColor: ColorValues.bgBrandSecondary(context),
      foregroundColor: ColorValues.fgBrandSecondary(context),
      iconColor: ColorValues.utilitySuccess600(context),
      padding: padding,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        iconTheme: IconThemeData(
          color: iconColor ?? foregroundColor,
          size: 15,
        ),
      ),
      child: Container(
        padding: padding ??
            EdgeInsets.symmetric(
              horizontal: WidthValues.spacingXs,
              vertical: WidthValues.spacingXxs,
            ),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(100),
        ),
        child: DefaultTextStyle(
          style: ExtendedTextTheme.textExtraSmall(context).copyWith(
            color: foregroundColor,
            fontWeight: FontWeight.w700,
          ),
          child: child,
        ),
      ),
    );
  }
}
