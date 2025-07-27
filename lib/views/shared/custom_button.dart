import 'package:api_address/config/app_colors.dart';
import 'package:api_address/config/app_dimensions.dart';
import 'package:api_address/config/font_utils.dart';
import 'package:chaos_wave_button/chaos_wave_button.dart';
import 'package:flutter/material.dart';





class CustomWaveButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final double? width;
  final double? height;
  final TextStyle? textStyle;

  const CustomWaveButton({
    super.key,
    required this.text,
    required this.onTap,
    this.width,
    this.height,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return WaveButton(
      width: width ?? MediaQuery.of(context).size.width * 0.8,
      height: height ?? AppDimensions.buttonHeight,
      text: text,
      textStyle: textStyle ?? FontUtils.buttonText,
      borderRadius: BorderRadius.circular(AppDimensions.borderRadiusDefault),
      border: Border.all(color: AppColors.primaryBlue),
      backgroundColor: AppColors.primaryBlue,
      lineColors: const [AppColors.primaryBlue, AppColors.accentBlue, AppColors.primaryBlue],
      animationDuration: const Duration(milliseconds: 500),
      onTap: onTap,
    );
  }
}