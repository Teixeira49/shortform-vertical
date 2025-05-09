import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../theme/extended_text_theme.dart';
import '../../../variables/values/values.dart';

/// {@template custom_text_field}
/// A custom field with a title. This widget should be the preferred option
/// for displaying text fields, dropdowns, and other single-input selectors in
/// the app, as it provides a consistent look and feel.
///
///
/// [title] is usually a [Text] widget. By default, the style of the
/// title is [ThemeData.textTheme.titleSmall] and should not be overriden,
/// unless necessary.
///
/// [child] is the widget that will be displayed below the title, usually
/// a [TextField], [TextFormField] or [DropdownButton].
/// {@endtemplate}
class CustomField extends StatelessWidget {
  /// {@macro custom_text_field}
  const CustomField({
    super.key,
    this.title,
    required this.child,
    this.footer,
  });

  final Widget? title;
  final Widget child;
  final Widget? footer;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DefaultTextStyle(
          style: ExtendedTextTheme.textSmall(context).copyWith(
              fontWeight: FontWeight.w500,
              color: ColorValues.textTertiary(context)),
          child: title ?? const SizedBox.shrink(),
        ),
        Gap(WidthValues.spacingXxs),
        child,
        //TODO: Add footer
        // if (footer != null) ...[
        //   Gap(WidthValues.spacingXxs),
        //   DefaultTextStyle(
        //     style: context.textTheme.labelMedium
        //             ?.copyWith(color: Consts.secondaryOne.shade300) ??
        //         const TextStyle(),
        //     child: footer!,
        //   ),
        // ],
      ],
    );
  }
}
