import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../variables/values/values.dart';
import 'custom_back_button.dart';

/// {@template base_layout}
/// Base layout for all pages. This widget is responsible for displaying the
/// background widget, the inner back button, and the page.
/// {@endtemplate}
class BaseLayout extends StatelessWidget {
  /// {@macro base_layout}
  BaseLayout({
    super.key,
    this.child,
    this.automaticallyImplyLeading = true,
    this.leading,
    this.showAppBar = true,
    this.bottom,
    this.actions,
    EdgeInsets? margins,
    this.backgroundColor,
    this.onPop,
    this.title,
  }) : margins =
            margins ?? EdgeInsets.symmetric(horizontal: WidthValues.padding);

  BaseLayout.builder({
    required Widget Function(BuildContext context) builder,
    super.key,
    this.automaticallyImplyLeading = true,
    this.leading,
    this.showAppBar = true,
    this.bottom,
    this.actions,
    EdgeInsets? margins,
    this.backgroundColor,
    this.onPop,
    this.title,
  })  : margins =
            margins ?? EdgeInsets.symmetric(horizontal: WidthValues.margin),
        child = Builder(builder: builder);

  final Widget? child;

  /// Whether to show the back button. Defaults to `true`.
  final bool automaticallyImplyLeading;

  /// The leading widget for the [AppBar]. If `null` and [automaticallyImplyLeading]
  /// is `true`, the [CustomBackButton] widget will be shown.
  final Widget? leading;

  /// Whether to show the [AppBar]. Defaults to `true`.
  final bool showAppBar;

  /// The margins for [BaseLayout]. Defaults to [EdgeInsets.all(Consts.margin)].
  final EdgeInsets margins;

  /// The bottom widget for the [AppBar]. Usually a [CustomTabBar].
  final PreferredSizeWidget? bottom;

  /// The background color for the [Scaffold].
  final Color? backgroundColor;

  /// The actions for the [AppBar].
  final List<Widget>? actions;

  /// The callback for the back button.
  final VoidCallback? onPop;

  /// The title for the [AppBar].
  final Widget? title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: backgroundColor,
      appBar: showAppBar
          ? _BaseLayoutAppBar(
              leadingWidth: 107,
              leading: _leading(context),
              bottom: bottom,
              actions: actions,
              title: title,
            )
          : null,
      body: Stack(
        children: [
          if (child != null)
            SizedBox.fromSize(
              size: MediaQuery.of(context).size,
              child: Padding(
                padding: margins,
                child: child,
              ),
            ),
        ],
      ),
    );
  }

  Widget? _leading(BuildContext context) {
    final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);

    if (leading != null) {
      return leading;
    } else if (automaticallyImplyLeading && (parentRoute?.canPop ?? false)) {
      return CustomBackButton(
        onPressed: () {
          context.pop();
          onPop?.call();
        },
      );
    } else {
      return null;
    }
  }
}

class _BaseLayoutAppBar extends AppBar implements PreferredSizeWidget {
  _BaseLayoutAppBar({
    super.leading,
    super.leadingWidth,
    super.actions,
    super.bottom,
    super.title,
  });

  bool get hasAnyChild => title != null || actions != null || leading != null;

  @override
  Size get preferredSize =>
      hasAnyChild ? bottom?.preferredSize ?? super.preferredSize : Size.zero;
}
