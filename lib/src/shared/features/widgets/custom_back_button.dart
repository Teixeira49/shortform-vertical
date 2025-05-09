// ignore_for_file: inference_failure_on_function_return_type

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../variables/values/color_values.dart';
import '../../../variables/values/values.dart';

/// {@template custom_back_button}
/// This widget represents a custom back button that follows the app's design
/// language. You should avoid using a [BackButton] directly, and use this
/// widget
/// instead.
/// {@endtemplate}
class CustomBackButton extends StatelessWidget {
  /// {@macro custom_back_button}
  const CustomBackButton({
    super.key,
    this.onPressed,
  });

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final foregroundColor = ColorValues.textPrimary(context);
    return TextButton(
      onPressed: onPressed ?? () => context.pop(),
      style: ButtonStyle(
        padding: WidgetStateProperty.all(EdgeInsets.zero),
        minimumSize: WidgetStateProperty.all(Size.zero),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        overlayColor: WidgetStateProperty.all(Colors.transparent),
      ),
      child: Row(
        children: [
          //TODO: Add custom icon for OS
          Gap(WidthValues.spacingMd),
          Icon(
            Icons.arrow_back,
            color: foregroundColor,
          ),
        ],
      ),
    );
  }
}
