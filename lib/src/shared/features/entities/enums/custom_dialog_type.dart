import 'package:flutter/material.dart';

import '../../../../variables/values/color_values.dart';

enum CustomDialogType {
  /// Use for informational messages that do not require any action from the
  /// user.
  info,

  /// Use for messages that indicate a successful operation.
  success,

  /// Use for messages that indicate a warning message, like prompting the user
  /// to confirm an action.
  warning,

  /// Use for messages that indicate an error ocurred.
  error;

  Color color(BuildContext context) {
    switch (this) {
      case CustomDialogType.info:
        return ColorValues.bgBrandSolid(context);
      case CustomDialogType.success:
        return ColorValues.bgSuccessSolid(context);
      case CustomDialogType.warning:
        return ColorValues.bgWarningSolid(context);
      case CustomDialogType.error:
        return ColorValues.bgErrorSolid(context);
    }
  }

  Color iconColor(BuildContext context) {
    return ColorValues.fgWhite(context);
  }

  IconData get icon {
    switch (this) {
      case CustomDialogType.info:
        return Icons.info;
      case CustomDialogType.success:
        return Icons.check;
      case CustomDialogType.warning:
        return Icons.warning;
      case CustomDialogType.error:
        return Icons.close;
    }
  }
}
