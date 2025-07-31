
import 'package:api_address/controllers/number_controller.dart';
import 'package:api_address/services/testservice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAddressController extends GetxController {
  final phoneNumber = TextEditingController();
  final city = TextEditingController();
  final addressLine = TextEditingController();
  final label = TextEditingController();
  final state = TextEditingController();
  final postalCode = TextEditingController();
  final latitude = TextEditingController();
  final longitude = TextEditingController();
  final nameController = TextEditingController();

  final isLoading = false.obs;

  final AddAddressRepository _repository = AddAddressRepository();
 final AppStorage _storage = AppStorage();

  void submitAddress() async {
    final userId = _storage.getId();
    if (userId == null) {
      Get.snackbar("User ID Not Found", "Please login or store your user ID first.");
      return;
    }

    isLoading.value = true;

    try {
      final response = await _repository.addAddress({
        "user_id": userId,
        "label": label.text,
        "addressLine": addressLine.text,
        "city": city.text,
        "state": state.text,
        "postalCode": postalCode.text,
        "latitude": double.tryParse(latitude.text),
        "longitude": double.tryParse(longitude.text),
        "phone_number": phoneNumber.text.isEmpty ? null : phoneNumber.text,
      });

      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.snackbar('Success', 'Address submitted! ID: ${response.data['id']}');
        clearForm();
      } else {
        Get.snackbar('Error', 'Failed to add address');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void clearForm() {
    phoneNumber.clear();
    city.clear();
    addressLine.clear();
    label.clear();
    state.clear();
    postalCode.clear();
    latitude.clear();
    longitude.clear();
    nameController.clear();
  }

  @override
  void onClose() {
    phoneNumber.dispose();
    city.dispose();
    addressLine.dispose();
    label.dispose();
    state.dispose();
    postalCode.dispose();
    latitude.dispose();
    longitude.dispose();
    nameController.dispose();
    super.onClose();
  }
}
