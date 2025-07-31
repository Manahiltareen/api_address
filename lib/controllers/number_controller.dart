import 'package:api_address/services/number.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';





class RegistrationController extends GetxController {
  final mobileNumber = TextEditingController();
  var isLoading = false.obs;
  final RegistrationRepository _repository = RegistrationRepository();

  AppStorage appStorage = AppStorage();
  Future<void> register() async {
    if (mobileNumber.text.isEmpty) {
      Get.snackbar('Error', 'Please enter a mobile number');
      return;
    }

    isLoading.value = true;
    try {
      final userId = await _repository.registerUser(mobileNumber.text);
      print('------$userId');
      appStorage.addId( userId);
      print('after successfuly, userID:=${appStorage.getId()}');


      Get.snackbar('Success', 'Registered successfully, userid: $userId');
    } catch (e) {
      Get.snackbar('Error', 'Registration failed: $e');
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    mobileNumber.dispose();
    super.onClose();
  }
}


class AppStorage {
 final GetStorage _storage = GetStorage();
  addId(userId){
    _storage.write('userId', userId);
  }
  getId(){
  return  _storage.read('userId');

}

}