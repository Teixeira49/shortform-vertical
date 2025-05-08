import 'package:flutter/material.dart';

class StringHelpers {
  /// Converts a string to a list of words.
  static List<String> toWords(String str) {
    return str.split(RegExp(r'\s+'));
  }

  /// Converts a string to a list of characters.
  static List<String> toCharacters(String str) {
    return str.split('');
  }

  /// Converts a string to a list of sentences.
  static List<String> toSentences(String str) {
    return str.split(RegExp(r'(?<=[.!?])\s+'));
  }

  static String capitalize(String str) {
    if (str.isEmpty) return str;
    return str[0].toUpperCase() + str.substring(1);
  }

  static String getCurrentLanguage(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final language = locale.languageCode;
    //String region = locale.countryCode ?? '';

    return language; // Región: $region';
  }

  static Color selectFontColor(Color backgroundColor) {
    if (backgroundColor.computeLuminance() > 0.5) {
      return Colors.black;
    } else {
      return Colors.white;
    }

  }
}
