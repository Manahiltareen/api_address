import 'package:api_address/services/api_add_address_service.dart';
import 'package:api_address/services/testservice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
class AddAddressController extends GetxController {
  Rx<bool> isLoading = false.obs;
  Rx<TextEditingController> fullName = TextEditingController().obs;
  Rx<TextEditingController>phoneNumber = TextEditingController().obs;
  Rx<TextEditingController> city = TextEditingController().obs;
  Rx<TextEditingController> address = TextEditingController().obs;
  Rx<TextEditingController> label= TextEditingController().obs;
  Rx<TextEditingController> state= TextEditingController().obs;
  Rx<TextEditingController> postalCode= TextEditingController().obs;
  Rx<TextEditingController> latitude= TextEditingController().obs;
  Rx<TextEditingController> longitude= TextEditingController().obs;
  TextEditingController testController=TextEditingController();
  Rx<bool> isLoading = false.obs;
  var city = "".obs;
  var addressLine = "".obs;
  var label = "".obs;
  var state = "".obs;
  var postalCode = "".obs;
  var latitude = "".obs;
  var longitude = "".obs;
  var user_id = "".obs;
TextEditingController  nameController=TextEditingController();
  final AddAddressRepository _repository = AddAddressRepository();
  final _storage = GetStorage();
AppStoragee appStoragee=AppStoragee();
  String? validateRequired(String value, String fieldName) {
    if (value.trim().isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  String? validateNumeric(String value, String fieldName) {
    if (value.trim().isEmpty) {
      return '$fieldName is required';
    }
    if (double.tryParse(value) == null) {
      return '$fieldName must be a valid number';
    }
    return null;
  }

  void submitAddress() async {
    if (validateRequired(label.value, 'Label') != null ||
        validateRequired(user_id.value, 'Label') != null ||
        validateRequired(addressLine.value, 'Address Line') != null ||
        validateRequired(city.value, 'City') != null ||
        validateRequired(state.value, 'State') != null ||
        validateRequired(postalCode.value, 'Postal Code') != null ||
        validateNumeric(latitude.value, 'Latitude') != null ||
        validateNumeric(longitude.value, 'Longitude') != null) {
      Get.snackbar('Error', 'Please fill all fields correctly');
      return;
    }

    isLoading.value = true;

    try {
      final addressId = await _repository.addAddress(
        city: city.value,
        label: label.value,
        state: state.value,
        address: addressLine.value,
        postalCode: postalCode.value,
        latitude: latitude.value,
        longitude: longitude.value,
        user_id:  user_id.value
        //appStoragee.getId()//user_id.value,
      );

      Get.snackbar('Success', 'Address submitted ID: $addressId');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}

class AppStoragee
{
  
  final  String userid='userid';
  GetStorage _storage=GetStorage();

  inserId(int id)async
  {
    await _storage.write(userid, id);
  }

  getId()
  {
    return _storage.read(userid);
  }
  
  
}



