import 'package:api_address/models/address_model.dart';
import 'package:api_address/repositories/address_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:dio/dio.dart';

class GetAddressController extends GetxController {
  final AddressService _addressService = AddressService();

  final RxList<Address> addresses = <Address>[].obs;
  final Rx<Address?> selectedAddress = Rx<Address?>(null);
  final RxBool isLoading = true.obs;
  final RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchAddresses();
  }

  Future<void> fetchAddresses() async {
    isLoading.value = true;
    errorMessage.value = '';
    try {
      final fetchedAddresses = await _addressService.fetchAddresses();
      addresses.assignAll(fetchedAddresses);
      if (addresses.isNotEmpty && selectedAddress.value == null) {
        selectedAddress.value = addresses.first;
      }

    } catch (e) {
      errorMessage.value = 'Failed to load addresses: An error occurred.';
      Get.snackbar('Error', 'Failed to load addresses. Please try again.',
        backgroundColor: Colors.red, colorText: Colors.white, icon: Icon(Icons.error, color: Colors.white),
        duration: Duration(seconds: 4),
      );
    } finally {
      isLoading.value = false;
    }
  }
  void selectAddress(Address address) {
    selectedAddress.value = address;
  }

}