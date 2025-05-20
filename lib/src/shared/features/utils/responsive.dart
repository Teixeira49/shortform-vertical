import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  const Responsive({
    required this.mobile,
    required this.tablet,
    required this.desktop,
    super.key,
  });

  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  /// A utility method to check if the current device is mobile.
  ///
  /// This method checks the width of the device and returns true if it is less than 600 pixels.
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 600;
  }

  /// A utility method to check if the current device is tablet.
  ///
  /// This method checks the width of the device and returns true if it is between 600 and 1200 pixels.

  static bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.width >= 600 &&
        MediaQuery.of(context).size.width < 1200;
  }

  /// A utility method to check if the current device is desktop.
  ///
  /// This method checks the width of the device and returns true if it is greater than or equal to 1200 pixels.

  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= 1200;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width < 600) {
      return mobile;
    } else if (width < 1200) {
      return tablet;
    } else {
      return desktop;
    }
  }
}
