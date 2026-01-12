import 'package:flutter/material.dart';

class Responsive {
  // Breakpoint Constants
  static const double mobileBreakpoint = 600.0;
  static const double tabletBreakpoint = 900.0;
  static const double desktopBreakpoint = 1200.0;
  static const double maxContentWidth = 1200.0;

  // Screen Type Checks
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < mobileBreakpoint;
  }

  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= mobileBreakpoint && width < desktopBreakpoint;
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= desktopBreakpoint;
  }

  // Responsive Value Helper
  static T value<T>(
    BuildContext context, {
    required T mobile,
    T? tablet,
    required T desktop,
  }) {
    if (isDesktop(context)) {
      return desktop;
    } else if (isTablet(context)) {
      return tablet ?? mobile;
    } else {
      return mobile;
    }
  }

  // Padding Helpers
  static EdgeInsets pagePadding(BuildContext context) {
    if (isMobile(context)) {
      return const EdgeInsets.symmetric(horizontal: 20, vertical: 40);
    } else if (isTablet(context)) {
      return const EdgeInsets.symmetric(horizontal: 40, vertical: 60);
    } else {
      return const EdgeInsets.symmetric(horizontal: 80, vertical: 80);
    }
  }

  static EdgeInsets sectionPadding(BuildContext context) {
    if (isMobile(context)) {
      return const EdgeInsets.symmetric(vertical: 40);
    } else if (isTablet(context)) {
      return const EdgeInsets.symmetric(vertical: 60);
    } else {
      return const EdgeInsets.symmetric(vertical: 80);
    }
  }

  // Grid Column Count
  static int gridColumns(BuildContext context, {int mobile = 1, int tablet = 2, int desktop = 3}) {
    if (isDesktop(context)) {
      return desktop;
    } else if (isTablet(context)) {
      return tablet;
    } else {
      return mobile;
    }
  }

  // Font Size Scaler
  static double fontSize(BuildContext context, double baseSize) {
    if (isMobile(context)) {
      return baseSize * 0.85;
    } else if (isTablet(context)) {
      return baseSize * 0.95;
    } else {
      return baseSize;
    }
  }

  // Container Max Width
  static BoxConstraints contentConstraints() {
    return const BoxConstraints(maxWidth: maxContentWidth);
  }

  // Responsive Builder Widget
  static Widget builder({
    required BuildContext context,
    required Widget mobile,
    Widget? tablet,
    required Widget desktop,
  }) {
    if (isDesktop(context)) {
      return desktop;
    } else if (isTablet(context)) {
      return tablet ?? mobile;
    } else {
      return mobile;
    }
  }
}
