import 'package:flutter/material.dart';
import 'package:venetiktok/src/variables/variables.dart';

class AppTheme {
  static ThemeData theme(BuildContext context) {
    final brightness = Theme.of(context).brightness;

    return ThemeData(
      brightness: brightness,
      primaryColor: ColorValues.utilityBrand500(context),
      useMaterial3: false,
      appBarTheme: _CustomThemeValues.appBarTheme(context),
      textTheme: _CustomThemeValues.textTheme(context),
      elevatedButtonTheme: _CustomThemeValues.elevatedButtonTheme(context),
      outlinedButtonTheme: _CustomThemeValues.outlinedButtonTheme(context),
      iconTheme: _CustomThemeValues.iconTheme(context),
      canvasColor: ColorValues.bgSecondary(context),
      dialogTheme: _CustomThemeValues.dialogTheme(context),
      cardTheme: _CustomThemeValues.cardTheme(context),
      dividerTheme: _CustomThemeValues.dividerTheme(context),
      scaffoldBackgroundColor: ColorValues.bgPrimary(context),
      inputDecorationTheme: _CustomThemeValues.inputDecorationTheme(context),
      bottomNavigationBarTheme:
          _CustomThemeValues.bottomNavigationBarTheme(context),
      textSelectionTheme: _CustomThemeValues.textSelectionTheme(context),
    );
  }
}

class _CustomThemeValues {
  static TextTheme textTheme(BuildContext context) =>
      TextValues.fontFamily(context).copyWith(
        displayLarge: TextStyle(
          color: ColorValues.textPrimary(context),
          fontWeight: TextValues.bold,
          fontSize: TextValues.displayMd,
        ),
        displayMedium: TextStyle(
          color: ColorValues.textPrimary(context),
          fontWeight: TextValues.bold,
          fontSize: TextValues.displaySm,
        ),
        displaySmall: TextStyle(
          color: ColorValues.textPrimary(context),
          fontWeight: TextValues.bold,
          fontSize: TextValues.displayXs,
        ),
        titleLarge: TextStyle(
          color: ColorValues.textPrimary(context),
          fontWeight: TextValues.bold,
          fontSize: TextValues.displayXs,
        ),
        titleSmall: TextStyle(
          color: ColorValues.textPrimary(context),
          fontWeight: TextValues.semibold,
          fontSize: TextValues.textXl,
        ),
        headlineMedium: TextStyle(
          color: ColorValues.textSecondary(context),
          fontWeight: TextValues.semibold,
          fontSize: TextValues.textLg,
        ),
        bodyMedium: TextStyle(
          color: ColorValues.textTertiary(context),
          fontWeight: TextValues.regular,
          fontSize: TextValues.textSm,
        ),
        bodySmall: TextStyle(
          color: ColorValues.textQuaternary(context),
          fontWeight: TextValues.regular,
          fontSize: TextValues.textXs,
        ),
      );

  static ElevatedButtonThemeData elevatedButtonTheme(BuildContext context) =>
      ElevatedButtonThemeData(
        style: const ButtonStyle().merge(
          ElevatedButton.styleFrom(
            elevation: 0,
            padding: EdgeInsets.symmetric(
              vertical: WidthValues.spacingMd,
              horizontal: WidthValues.spacingXl,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(WidthValues.radiusMd),
            ),
            disabledBackgroundColor: ColorValues.bgDisabled(context),
            disabledForegroundColor: ColorValues.fgDisabled(context),
            backgroundColor: ColorValues.buttonPrimaryBg(context),
            foregroundColor: ColorValues.buttonPrimaryFg(context),
            textStyle: const TextStyle(
              fontWeight: TextValues.semibold,
              fontSize: TextValues.textMd,
            ),
          ),
        ),
      );

  static OutlinedButtonThemeData outlinedButtonTheme(BuildContext context) =>
      OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.symmetric(
            vertical: WidthValues.spacingMd,
            horizontal: WidthValues.spacingXl,
          ),
          foregroundColor: ColorValues.buttonSecondaryFg(context),
          side: BorderSide(
            color: ColorValues.buttonSecondaryBorder(context),
            width: 1.5,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(WidthValues.radiusMd),
          ),
          textStyle: const TextStyle(
            fontWeight: TextValues.semibold,
            fontSize: TextValues.textMd,
          ),
        ),
      );

  static IconThemeData iconTheme(BuildContext context) => IconThemeData(
        color: ColorValues.featuredIconFgBrand(context),
        size: 24,
      );

  static AppBarTheme appBarTheme(BuildContext context) => AppBarTheme(
        color: ColorValues.bgPrimary(context),
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: ColorValues.textPrimary(context),
        ),
        actionsIconTheme:
            IconThemeData(color: ColorValues.fgQuaternary(context)),
        shadowColor: ColorValues.utilityGray100(context),
      );

  static DialogTheme dialogTheme(BuildContext context) => DialogTheme(
        backgroundColor: ColorValues.bgActive(context),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(WidthValues.radiusMd),
        ),
      );

  static CardTheme cardTheme(BuildContext context) => CardTheme(
        elevation: 0,
        margin: EdgeInsets.symmetric(vertical: WidthValues.padding),
        color: ColorValues.bgPrimary(context),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(WidthValues.radiusMd),
          side: BorderSide(color: ColorValues.borderSecondary(context)),
        ),
      );

  static DividerThemeData dividerTheme(BuildContext context) =>
      DividerThemeData(
        color: ColorValues.borderDisabledSubtle(context),
        thickness: 0.5,
        space: 0,
      );
  static InputDecorationTheme inputDecorationTheme(BuildContext context) =>
      InputDecorationTheme(
        isDense: true,
        border: MaterialStateOutlineInputBorder.resolveWith(
          (states) {
            Color foregroundColor;
            if (states.contains(WidgetState.disabled)) {
              foregroundColor = ColorValues.borderDisabled(context);
            } else if (states.contains(WidgetState.focused)) {
              foregroundColor = ColorValues.fgBrandPrimary(context);
            } else {
              foregroundColor = ColorValues.borderPrimary(context);
            }

            return OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(WidthValues.radiusXs),
              ),
              borderSide: BorderSide(color: foregroundColor, width: 1.5),
            );
          },
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: 12,
          horizontal: WidthValues.spacingLg,
        ),
        labelStyle: ExtendedTextTheme.textSmall(context).copyWith(
          color: ColorValues.fgBrandPrimary(context),
        ),
        hintStyle: WidgetStateTextStyle.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return ExtendedTextTheme.textSmall(context)
                .copyWith(color: ColorValues.borderDisabled(context));
          }
          return ExtendedTextTheme.textSmall(context).copyWith(
              color: ColorValues.borderPrimary(context),
              fontWeight: FontWeight.w500);
        }),
        suffixIconColor: WidgetStateColor.resolveWith(
          (states) {
            if (states.contains(WidgetState.disabled)) {
              return ColorValues.borderDisabled(context);
            }
            if (states.contains(WidgetState.focused)) {
              return ColorValues.fgBrandPrimary(context);
            }
            return ColorValues.borderPrimary(context);
          },
        ),
      );

  static BottomNavigationBarThemeData bottomNavigationBarTheme(
    BuildContext context,
  ) =>
      BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: ColorValues.bgPrimary(context),
        landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
        selectedItemColor: ColorValues.fgBrandPrimary(context),
        unselectedItemColor: ColorValues.fgDisabled(context),
        showUnselectedLabels: true,
        showSelectedLabels: true,
        enableFeedback: true,
        selectedLabelStyle: ExtendedTextTheme.textExtraSmall(context).copyWith(
          fontSize: 10.5,
          fontWeight: FontWeight.w700,
        ),
        unselectedLabelStyle:
            ExtendedTextTheme.textExtraSmall(context).copyWith(
          fontSize: 10.5,
          fontWeight: FontWeight.w600,
        ),
      );

  static TextSelectionThemeData textSelectionTheme(BuildContext context) =>
      TextSelectionThemeData(
        cursorColor: ColorValues.fgBrandPrimary(context),
        selectionColor: ColorValues.bgActive(context),
        selectionHandleColor: ColorValues.fgBrandPrimary(context),
      );
}
