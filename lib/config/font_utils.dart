import 'package:api_address/config/app_colors.dart';
import 'package:flutter/material.dart';


class FontUtils {
  // --- Headings ---
  static const TextStyle heading1 = TextStyle(
    fontSize: 28.0,
    fontWeight: FontWeight.bold,
    color: AppColors.darkGrey,
  );

  static const TextStyle heading2 = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    color: AppColors.darkGrey,
  );

  // --- Subheadings ---
  static const TextStyle subheading1 = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w600,
    color: AppColors.darkGrey,
  );

  static const TextStyle subheading2 = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
    color: AppColors.darkGrey,
  );

  // --- Body Text ---
  static const TextStyle bodyText = TextStyle(
    fontSize: 16.0,
    color: AppColors.darkGrey,
  );

  static const TextStyle bodyTextSmall = TextStyle(
    fontSize: 14.0,
    color: AppColors.darkGrey,
  );

  // --- Input & Hint Text ---
  static const TextStyle inputText = TextStyle(
    fontSize: 16.0,
    color: AppColors.darkGrey,
  );

  static const TextStyle hintText = TextStyle(
    fontSize: 16.0,
    color: AppColors.mediumGrey,
  );

  // --- Button Text ---
  static const TextStyle buttonText = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    color: AppColors.white, // Default for primary buttons
  );

  // --- Link Text ---
  static const TextStyle linkText = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryBlue,
  );

  // --- Other specific styles ---
  static const TextStyle appBarTitle = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
    color: AppColors.darkGrey,
  );
}