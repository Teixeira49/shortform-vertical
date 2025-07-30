// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venetiktok/src/variables/values/color_values.dart';
import 'package:venetiktok/src/variables/values/text_values.dart';

extension ExtendedTextTheme on TextTheme {
  static TextStyle displayTwoExtraLarge(BuildContext context) =>
      GoogleFonts.poppins(
        fontSize: TextValues.display2xl,
        fontWeight: TextValues.regular,
        color: ColorValues.textPrimary(context),
      );

  static TextStyle displayExtraLarge(BuildContext context) =>
      GoogleFonts.poppins(
        fontSize: TextValues.displayXl,
        fontWeight: TextValues.regular,
        color: ColorValues.textPrimary(context),
      );

  static TextStyle displayLarge(BuildContext context) => GoogleFonts.poppins(
        fontSize: TextValues.displayLg,
        fontWeight: TextValues.regular,
        color: ColorValues.textPrimary(context),
      );

  static TextStyle displayMedium(BuildContext context) => GoogleFonts.poppins(
        fontSize: TextValues.displayMd,
        fontWeight: TextValues.regular,
        color: ColorValues.textPrimary(context),
      );

  static TextStyle displaySmall(BuildContext context) => GoogleFonts.poppins(
        fontSize: TextValues.displaySm,
        fontWeight: TextValues.regular,
        color: ColorValues.textPrimary(context),
      );

  static TextStyle displayExtraSmall(BuildContext context) =>
      GoogleFonts.poppins(
        fontSize: TextValues.displayXs,
        fontWeight: TextValues.regular,
        color: ColorValues.textPrimary(context),
      );

  static TextStyle textExtraLarge(BuildContext context) => GoogleFonts.poppins(
        fontSize: TextValues.textXl,
        fontWeight: TextValues.regular,
        color: ColorValues.textPrimary(context),
      );

  static TextStyle textLarge(BuildContext context) => GoogleFonts.poppins(
        fontSize: TextValues.textLg,
        fontWeight: TextValues.regular,
        color: ColorValues.textPrimary(context),
      );

  static TextStyle textMedium(BuildContext context) => GoogleFonts.poppins(
        fontSize: TextValues.textMd,
        fontWeight: TextValues.regular,
        color: ColorValues.textPrimary(context),
      );

  static TextStyle textSmall(BuildContext context) => GoogleFonts.poppins(
        fontSize: TextValues.textSm,
        fontWeight: TextValues.regular,
        color: ColorValues.textPrimary(context),
      );

  static TextStyle textExtraSmall(BuildContext context) => GoogleFonts.poppins(
        fontSize: TextValues.textXs,
        fontWeight: TextValues.regular,
        color: ColorValues.textPrimary(context),
      );

  static TextStyle titleExtraLarge(BuildContext context) => GoogleFonts.poppins(
    fontSize: TextValues.textXl,
    fontWeight: TextValues.bold,
    color: ColorValues.textPrimary(context),
  );

  static TextStyle titleLarge(BuildContext context) => GoogleFonts.poppins(
    fontSize: TextValues.textLg,
    fontWeight: TextValues.bold,
    color: ColorValues.textPrimary(context),
  );

  static TextStyle titleMedium(BuildContext context) => GoogleFonts.poppins(
    fontSize: TextValues.textMd,
    fontWeight: TextValues.bold,
    color: ColorValues.textPrimary(context),
  );

  static TextStyle titleSmall(BuildContext context) => GoogleFonts.poppins(
    fontSize: TextValues.textSm,
    fontWeight: TextValues.bold,
    color: ColorValues.textPrimary(context),
  );

  static TextStyle titleExtraSmall(BuildContext context) => GoogleFonts.poppins(
    fontSize: TextValues.textXs,
    fontWeight: TextValues.bold,
    color: ColorValues.textPrimary(context),
  );

  static TextStyle displayTitleExtraLarge(BuildContext context) => GoogleFonts.poppins(
    fontSize: TextValues.displayXl,
    fontWeight: TextValues.bold,
    color: ColorValues.textPrimary(context),
  );

  static TextStyle displayTitleLarge(BuildContext context) => GoogleFonts.poppins(
    fontSize: TextValues.displayLg,
    fontWeight: TextValues.bold,
    color: ColorValues.textPrimary(context),
  );

  static TextStyle displayTitleMedium(BuildContext context) => GoogleFonts.poppins(
    fontSize: TextValues.displayMd,
    fontWeight: TextValues.bold,
    color: ColorValues.textPrimary(context),
  );

  static TextStyle displayTitleSmall(BuildContext context) => GoogleFonts.poppins(
    fontSize: TextValues.displaySm,
    fontWeight: TextValues.bold,
    color: ColorValues.textPrimary(context),
  );

  static TextStyle displayTitExtraSmall(BuildContext context) => GoogleFonts.poppins(
    fontSize: TextValues.displayXs,
    fontWeight: TextValues.bold,
    color: ColorValues.textPrimary(context),
  );
}
