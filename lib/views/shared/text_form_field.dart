import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';

import 'package:api_address/config/app_colors.dart';
import 'package:api_address/config/app_dimensions.dart';
import 'package:api_address/config/font_utils.dart';

enum InputValidationType {
  email,
  phoneNumber,
  password,
  confirmPassword,
  name,
  id,
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
  final String? Function(String?)? customValidator;

  const AppTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.prefixIcon,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.onToggleObscureText,
    this.validationType = InputValidationType.none,
    this.customValidator,
  });

  String? _validator(String? value) {
    if (customValidator != null) {
      final customResult = customValidator!(value);
      if (customResult != null) return customResult;
    }

    if (value == null || value.isEmpty) {
      return 'Please enter $hintText';
    }

    switch (validationType) {
      case InputValidationType.email:
        if (!GetUtils.isEmail(value)) return 'Please enter a valid email';
        break;
      case InputValidationType.phoneNumber:
        if (!GetUtils.isPhoneNumber(value)) return 'Please enter a valid phone number';
        break;
      case InputValidationType.password:
        if (value.length < 6) return 'Password must be at least 6 characters';
        break;
      case InputValidationType.name:
        if (value.length < 2) return 'Name must be at least 2 characters';
        break;
      case InputValidationType.id:
        if (!GetUtils.isNumericOnly(value) || value.length != 7) {
          return 'Please enter a valid 7-digit ID';
        }
        break;
      case InputValidationType.confirmPassword:
        break;
      case InputValidationType.none:
        break;
    }
    return null;
  }

  OutlineInputBorder _buildBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppDimensions.borderRadiusDefault),
      borderSide: BorderSide(color: color, width: 1.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      style: FontUtils.inputText,
      validator: _validator,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.cardBackground,
        hintText: hintText,
        hintStyle: FontUtils.hintText,
        prefixIcon: Padding(
          padding: const EdgeInsets.only(
            top: 6,
              left: 12.0, right: 8.0),
          child: FaIcon(
            prefixIcon,
            color: AppColors.primaryBlue,
            size: AppDimensions.iconSizeSmall,
          ),
        ),
        prefixIconConstraints: const BoxConstraints(minWidth: 40, minHeight: 40),
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
        contentPadding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 12.0),
        border: _buildBorder(AppColors.borderColor),
        focusedBorder: _buildBorder(AppColors.primaryBlue),
        enabledBorder: _buildBorder(AppColors.borderColor),
        errorBorder: _buildBorder(AppColors.errorRed),
        focusedErrorBorder: _buildBorder(AppColors.errorRed),
        errorStyle: const TextStyle(fontSize: 12.0),
      ),
    );
  }
}
