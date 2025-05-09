// ignore_for_file: inference_failure_on_function_return_type

import 'package:flutter/material.dart';

import '../../../variables/values/values.dart';

/// Custom [TabBar] widget following the design system of the app.
///
/// The `tabs` parameter is usually a list of [Tab] widgets
class CustomTabBar extends PreferredSize {
  CustomTabBar({
    required BuildContext context,
    required Function(int index) onTap,
    required List<Widget> tabs,
    super.key,
    Size? preferredSize,
    Widget? title,
    EdgeInsets? margins,
    TabController? controller,
  }) : super(
          preferredSize: preferredSize ?? const Size.fromHeight(kToolbarHeight),
          child: Container(
            margin: margins ??
                EdgeInsets.symmetric(horizontal: WidthValues.spacingMd),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Theme.of(context).dividerTheme.color ??
                      ColorValues.utilityGray200(context),
                  width: 0.5,
                ),
              ),
            ),
            child: Column(
              children: [
                if (title != null) title,
                Row(
                  children: [
                    TabBar(
                      controller: controller,
                      tabs: tabs,
                      isScrollable: true,
                      onTap: (value) => onTap(value),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
}
