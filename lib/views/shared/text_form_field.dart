import 'package:api_address/config/app_colors.dart';
import 'package:api_address/config/app_dimensions.dart';
import 'package:api_address/config/font_utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get_utils/src/get_utils/get_utils.dart';


enum InputValidationType {
  email,
  phoneNumber,
  password,
  confirmPassword,
  name,
  id, // Example for ID validation
  none,
}

class AppTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData prefixIcon;
  final TextInputType keyboardType;
  final bool obscureText;
  final VoidCallback? onToggleObscureText;
  final InputValidationType validationType;
  final String? Function(String?)? customValidator; // For specific cases like confirm password

  const AppTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.prefixIcon,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.onToggleObscureText,
    this.validationType = InputValidationType.none,
    this.customValidator, // Pass a custom validator if needed
  });

  String? _validator(String? value) {
    // If a customValidator is provided, use it first
    if (customValidator != null) {
      final customResult = customValidator!(value);
      if (customResult != null) {
        return customResult;
      }
    }

    if (value == null || value.isEmpty) {
      // Return a generic message if empty, unless overridden by customValidator
      return 'Please enter $hintText';
    }

    switch (validationType) {
      case InputValidationType.email:
        if (!GetUtils.isEmail(value)) {
          return 'Please enter a valid email';
        }
        break;
      case InputValidationType.phoneNumber:
      // A more robust phone number regex might be needed for specific regions
        if (!GetUtils.isPhoneNumber(value)) { // Basic check, might need refinement for PAK numbers
          return 'Please enter a valid phone number';
        }
        break;
      case InputValidationType.password:
        if (value.length < 6) {
          return 'Password must be at least 6 characters';
        }
        break;
      case InputValidationType.name:
        if (value.length < 2) {
          return 'Name must be at least 2 characters';
        }
        break;
      case InputValidationType.id:
        if (!GetUtils.isNumericOnly(value) || value.length != 7) {
          return 'Please enter a valid 7-digit ID';
        }
        break;
      case InputValidationType.confirmPassword:
      // This is primarily handled by customValidator in signup screen
      // If no custom validator, just ensure it's not empty (already handled above)
        break;
      case InputValidationType.none:
      // No specific validation other than not empty
        break;
    }
    return null; // Return null if valid
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimensions.inputFieldHeight, // Fixed height for consistency
      decoration: BoxDecoration(
        color: AppColors.cardBackground, // White background
        borderRadius: BorderRadius.circular(AppDimensions.borderRadiusDefault),
        border: Border.all(color: AppColors.borderColor), // Light border
        boxShadow: [
          // Subtle shadow for the "inward" effect
          BoxShadow(
            color: AppColors.shadowColor.withOpacity(0.05),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        style: FontUtils.inputText,
        validator: _validator,
        decoration: InputDecoration(
          prefixIcon: FaIcon(
            prefixIcon,
            color: AppColors.primaryBlue,
            size: AppDimensions.iconSizeSmall,
          ),
          hintText: hintText,
          hintStyle: FontUtils.hintText,
          border: InputBorder.none, // No border for the TextFormField itself
          contentPadding: const EdgeInsets.symmetric(vertical: AppDimensions.paddingDefault), // Correct padding
          errorStyle: const TextStyle(fontSize: 12.0), // Smaller error text
          errorBorder: OutlineInputBorder( // Red border on error
            borderRadius: BorderRadius.circular(AppDimensions.borderRadiusDefault),
            borderSide: const BorderSide(color: AppColors.errorRed, width: 1.0),
          ),
          focusedErrorBorder: OutlineInputBorder( // Red border when focused on error
            borderRadius: BorderRadius.circular(AppDimensions.borderRadiusDefault),
            borderSide: const BorderSide(color: AppColors.errorRed, width: 1.0),
          ),
          suffixIcon: onToggleObscureText != null
              ? IconButton(
            icon: FaIcon(
              obscureText ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye,
              color: AppColors.mediumGrey,
              size: AppDimensions.iconSizeSmall,
            ),
            onPressed: onToggleObscureText,
          )
              : null,
        ),
      ),
    );
  }
}
