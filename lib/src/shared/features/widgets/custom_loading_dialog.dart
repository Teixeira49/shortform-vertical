// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


import '../../../router.dart';
import '../../../variables/values/values.dart';

/// {@template loading_dialog}
/// Custom loading dialog of the app.
///
/// To show the dialog, use [LoadingDialog.show(context)].
///
/// Calling [LoadingDialog.hide(context)] will hide the dialog.
///
/// *Warning*: Calling [LoadingDialog.hide(context)] without any dialog will
/// result in popping the current route.
///
/// {@endtemplate}
class CustomLoadingDialog extends StatelessWidget {
  /// {@macro loading_dialog}
  const CustomLoadingDialog({super.key});

  static void show(BuildContext context, {Key? key}) => showDialog<void>(
        context: AppRouter.rootNavigatorKey.currentContext!,
        useRootNavigator: false,
        barrierDismissible: false,
        builder: (_) => CustomLoadingDialog(key: key),
      ).then((_) => FocusScope.of(context).requestFocus(FocusNode()));

  static void hide(BuildContext context) =>
      AppRouter.rootNavigatorKey.currentContext!.pop();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Center(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(WidthValues.radiusMd),
          ),
          child: Container(
            color: Colors.transparent,
            padding: EdgeInsets.all(WidthValues.spacingMd),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(
                  color: ColorValues.fgBrandPrimary(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
