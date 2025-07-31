import 'package:api_address/config/app_colors.dart';
import 'package:api_address/config/app_dimensions.dart';
import 'package:api_address/config/font_utils.dart';
import 'package:api_address/controllers/logincontroller.dart';
import 'package:api_address/controllers/number_controller.dart';
import 'package:api_address/views/auth/signup_screen.dart';
import 'package:api_address/views/routes/go_router.dart';
import 'package:api_address/views/shared/custom_auth_header.dart';
import 'package:api_address/views/shared/custom_button.dart';
import 'package:api_address/views/shared/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';




class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());
    RegistrationController registrationController = RegistrationController();

    return Scaffold(
      backgroundColor: AppColors.lightBackground, // Use light background for the rest of the screen
      // No AppBar when using custom header
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAuthHeader(
              title: 'Welcome Back',
              showBackButton: false,
            ),
            Padding( // Add padding around the rest of the content
              padding: const EdgeInsets.symmetric(horizontal: AppDimensions.paddingLarge),
              child: Form(
                key: controller.loginFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: AppDimensions.paddingLarge), // Space below header
                    AppTextFormField(
                      controller: registrationController.mobileNumber,
                      hintText: 'Phone number',
                      prefixIcon: FontAwesomeIcons.phone,
                      keyboardType: TextInputType.phone,
                      validationType: InputValidationType.phoneNumber,
                    ),
                    SizedBox(height: AppDimensions.paddingDefault),
                    Obx(() => AppTextFormField(
                      controller: controller.passwordController,
                      hintText: 'Password',
                      prefixIcon: FontAwesomeIcons.lock,
                      obscureText: controller.obscureText.value,
                      onToggleObscureText: controller.togglePasswordVisibility,
                      validationType: InputValidationType.password,
                    )),
                    SizedBox(height: AppDimensions.paddingSmall),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Get.snackbar(
                            'Info',
                            'Forgot Password functionality is not yet implemented.',
                            snackPosition: SnackPosition.BOTTOM,
                          );
                        },
                        child: Text(
                          'Forgot Password?',
                          style: FontUtils.linkText.copyWith(fontSize: FontUtils.bodyTextSmall.fontSize),
                        ),
                      ),
                    ),
                    SizedBox(height: AppDimensions.paddingLarge * 1.5),
                    Center(
                      child: CustomWaveButton(
                        text: 'Sign in',
                        onTap: () {
                          controller.login(context);
                          registrationController.register();
                        },
                        width: MediaQuery.of(context).size.width * 0.8,
                      ),
                    ),
                    SizedBox(height: AppDimensions.paddingLarge),
                    Center(
                      child: Text.rich(
                        TextSpan(
                          text: "Don't have an account? ",
                          style: FontUtils.bodyTextSmall,
                          children: [
                            TextSpan(
                              text: 'Sign up',
                              style: FontUtils.linkText.copyWith(fontSize: FontUtils.bodyTextSmall.fontSize),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Get.to(SignupScreen());
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: AppDimensions.paddingDefault),
                    Center(
                      child: Text(
                        'Or sign in with',
                        style: FontUtils.bodyTextSmall.copyWith(color: AppColors.mediumGrey),
                      ),
                    ),
                    SizedBox(height: AppDimensions.paddingDefault),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildSocialIconFA(
                          FontAwesomeIcons.google,
                          AppColors.primaryBlue,
                              () { /* Google sign-in logic */ },
                        ),
                        SizedBox(width: AppDimensions.paddingDefault),
                        _buildSocialIconFA(
                          FontAwesomeIcons.facebookF,
                          const Color(0xFF1877F2),
                              () { /* Facebook sign-in logic */ },
                        ),
                      ],
                    ),
                    SizedBox(height: AppDimensions.paddingLarge),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialIconFA(IconData iconData, Color iconColor, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: AppDimensions.socialIconSize,
        height: AppDimensions.socialIconSize,
        padding: const EdgeInsets.all(AppDimensions.paddingSmall),
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.borderColor, width: AppDimensions.dividerThickness),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowColor.withOpacity(0.05),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Center(
          child: FaIcon(
            iconData,
            color: iconColor,
            size: AppDimensions.iconSizeLarge,
          ),
        ),
      ),
    );
  }
}