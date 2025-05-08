import 'package:flutter/material.dart';
import 'package:venetiktok/src/variables/variables.dart';

class StylesConstants {
  static ButtonStyle textButtonStyle(BuildContext context, bool isMainButton) {
    final brandColor = ColorValues.fgBrandPrimary(context);

    final whiteColor = ColorValues.fgWhite(context);

    return ButtonStyle(
      backgroundColor: WidgetStateProperty.all(
        isMainButton ? brandColor : whiteColor,
      ),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(WidthValues.radiusXs),
          side: BorderSide(color: brandColor),
        ),
      ),
    );
  }
}
