import 'package:api_address/views/routes/go_router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  final phoneController = TextEditingController();
  final passwordController = TextEditingController();


  var obscureText = true.obs;

  void togglePasswordVisibility() {
    obscureText.value = !obscureText.value;
  }
//comment
  void login(BuildContext context) {
    if (loginFormKey.currentState!.validate()) {
      final _storage = GetStorage();
      final phone = _storage.read('phoneNumber');
      final password = _storage.read('password');
      if(phoneController.text == phone && passwordController.text == password ){
        Get.snackbar(
          'Success',
          'Login successful!',
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        Get.toNamed(Routes.AddAddress);
      }
      else {
        Get.snackbar('Error', 'Invalid phone number or password.',
            backgroundColor: Colors.red, colorText: Colors.white);
      }

    } else {
      Get.snackbar(
        'Error',
        'Please correct the errors in the form.',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  @override
  void onClose() {
    phoneController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}