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
    return Container( // Wrap WaveButton in a Container to apply gradient
      width: width ?? MediaQuery.of(context).size.width * 0.8,
      height: height ?? AppDimensions.buttonHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimensions.borderRadiusDefault),
        gradient: const LinearGradient(
          colors: [
            AppColors.primaryBlue, // Use your primary blue
            AppColors.accentBlue,  // A darker purple/indigo
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: WaveButton(

        width: double.infinity,
        height: double.infinity, // Make it fill the Container's height
        text: text,
        textStyle: textStyle ?? FontUtils.buttonText,
        borderRadius: BorderRadius.circular(AppDimensions.borderRadiusDefault),
        backgroundColor: Colors.transparent, // Crucial: make WaveButton's background transparent
        // Define colorful lineColors for the wave effect
        lineColors: const [
          Color(0xFFFFD700), // Gold
          Color(0xFFFF4500), // OrangeRed
          Color(0xFF00CED1), // DarkTurquoise
          Color(0xFF9400D3), // DarkViolet
        ],
        animationDuration: const Duration(milliseconds: 500),
        onTap: onTap,
      ),
    );
  }
}