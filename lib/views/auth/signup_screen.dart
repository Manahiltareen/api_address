import 'package:api_address/config/app_colors.dart';
import 'package:api_address/config/app_dimensions.dart';
import 'package:api_address/config/font_utils.dart';
import 'package:api_address/controllers/number_controller.dart';
import 'package:api_address/controllers/signup_controller.dart';
import 'package:api_address/views/routes/go_router.dart';
import 'package:api_address/views/shared/custom_auth_header.dart';
import 'package:api_address/views/shared/custom_button.dart';
import 'package:api_address/views/shared/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:go_router/go_router.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import 'package:get/get.dart'; // Import GetX







class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SignupController controller = Get.put(SignupController());
    final RegistrationController registrationController = Get.put(RegistrationController());


    return Scaffold(
      backgroundColor: AppColors.lightBackground,

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAuthHeader(
              title: 'Create an Account',
              showBackButton: true,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppDimensions.paddingLarge),
              child: Form(
                key: controller.signupFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: AppDimensions.paddingLarge), // Space below header
                    AppTextFormField(
                      controller: controller.fullNameController,
                      hintText: 'Full Name',
                      prefixIcon: FontAwesomeIcons.user,
                      validationType: InputValidationType.name,
                    ),
                    SizedBox(height: AppDimensions.paddingDefault),
                    AppTextFormField(
                      controller: registrationController.mobileNumber,
                      hintText: 'Phone number',
                      prefixIcon: FontAwesomeIcons.phone,
                      keyboardType: TextInputType.phone,
                      validationType: InputValidationType.phoneNumber,
                    ),
                    SizedBox(height: AppDimensions.paddingDefault),
                    AppTextFormField(
                      controller: controller.emailController,
                      hintText: 'Email Address (Optional)',
                      prefixIcon: FontAwesomeIcons.envelope,
                      keyboardType: TextInputType.emailAddress,
                      validationType: InputValidationType.email,
                    ),
                    SizedBox(height: AppDimensions.paddingDefault),
                    Obx(() => AppTextFormField(
                      controller: controller.passwordController,
                      hintText: 'Password',
                      prefixIcon: FontAwesomeIcons.lock,
                      obscureText: controller.obscurePassword.value,
                      onToggleObscureText: controller.togglePasswordVisibility,
                      validationType: InputValidationType.password,
                    )),
                    SizedBox(height: AppDimensions.paddingDefault),
                    Obx(() => AppTextFormField(
                      controller: controller.confirmPasswordController,
                      hintText: 'Confirm Password',
                      prefixIcon: FontAwesomeIcons.lock,
                      obscureText: controller.obscureConfirmPassword.value,
                      onToggleObscureText: controller.toggleConfirmPasswordVisibility,
                      validationType: InputValidationType.confirmPassword,
                      customValidator: controller.confirmPasswordValidator,
                    )),
                    SizedBox(height: AppDimensions.paddingLarge * 1.5),
                    Center(
                      child: CustomWaveButton(
                        text: 'Sign up',
                        onTap: () {
                           controller.signup(context);
                        },

                        width: MediaQuery.of(context).size.width * 0.8,
                      ),
                    ),
                    SizedBox(height: AppDimensions.paddingLarge),
                    Center(
                      child: Text.rich(
                        TextSpan(
                          text: "Already have an account? ",
                          style: FontUtils.bodyTextSmall,
                          children: [
                            TextSpan(
                              text: 'Login',
                              style: FontUtils.linkText.copyWith(fontSize: FontUtils.bodyTextSmall.fontSize),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Get.toNamed(Routes.login);
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: AppDimensions.paddingDefault),
                    Center(
                      child: Text(
                        'Or sign up with',
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
                              () {  },
                        ),
                        SizedBox(width: AppDimensions.paddingDefault),
                        _buildSocialIconFA(
                          FontAwesomeIcons.facebookF,
                          const Color(0xFF1877F2),
                              () {  },
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