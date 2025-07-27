import 'package:flutter/material.dart';

class MediaQueries {
  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static Orientation screenOrientation(BuildContext context) {
    return MediaQuery.of(context).orientation;
  }

  // Check if it's a small phone screen (e.g., typically < 600dp width)
  static bool isSmallScreen(BuildContext context) {
    return screenWidth(context) < 600;
  }

  // Check if it's a tablet screen (e.g., between 600dp and 1024dp width)
  static bool isTablet(BuildContext context) {
    return screenWidth(context) >= 600 && screenWidth(context) < 1024;
  }

  // Check if it's a large desktop screen (e.g., > 1024dp width)
  static bool isDesktop(BuildContext context) {
    return screenWidth(context) >= 1024;
  }

  // Responsive padding/spacing based on screen width
  static double responsivePadding(BuildContext context) {
    if (isDesktop(context)) {
      return 48.0;
    } else if (isTablet(context)) {
      return 32.0;
    } else {
      return 16.0; // Default for phones
    }
  }

  // Can also create responsive font sizes, though FontUtils handles static ones well
  static double responsiveFontSize(BuildContext context, double baseSize) {
    if (isDesktop(context)) {
      return baseSize * 1.2;
    } else if (isTablet(context)) {
      return baseSize * 1.1;
    } else {
      return baseSize;
    }
  }
}