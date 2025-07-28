// import 'package:api_address/services/api_add_address_service.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// class AddAddressController extends GetxController {
//   // Rx<bool> isLoading = false.obs;
//   // Rx<TextEditingController> fullName = TextEditingController().obs;
//   // Rx<TextEditingController>phoneNumber = TextEditingController().obs;
//   // Rx<TextEditingController> city = TextEditingController().obs;
//   // Rx<TextEditingController> address = TextEditingController().obs;
//   // Rx<TextEditingController> label= TextEditingController().obs;
//   // Rx<TextEditingController> state= TextEditingController().obs;
//   // Rx<TextEditingController> postalCode= TextEditingController().obs;
//   // Rx<TextEditingController> latitude= TextEditingController().obs;
//   // Rx<TextEditingController> longitude= TextEditingController().obs;
//   Rx<bool> isLoading = false.obs;
//   var city = "".obs;
//   var addressLine = "".obs;
//   var label = "".obs;
//   var state = "".obs;
//   var postalCode = "".obs;
//   var  latitude = "".obs;
//   var longitude= "".obs;
//
//
// final AddAddressRepository  _repository = AddAddressRepository();
// final _storage = GetStorage();
//
//   void submitAddress() async {
//     isLoading.value = true;
//     //
//     // final userId = await _storage.read('userid');
//     // if (userId == null) {
//     //   Get.snackbar('Error', 'Data not stored!');
//     //   isLoading.value = false;
//     //   return;
//     // }
//     try {
//       final addressId = await _repository.addAddress(
//         postalCode: postalCode.value,
//         state: state.value,
//         label:label.value ,
//         // userId: userId,
//         // fullName: fullName.string,
//         // phoneNumber: phoneNumber.string,
//         city: city.value,
//         address: addressLine.value, latitude: latitude.value,
//         longitude: longitude.value,
//       );
//
//       Get.snackbar('Success', 'Address submitted ID: $addressId');
//     } catch (e) {
//       Get.snackbar('Error', e.toString());
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:get_storage/get_storage.dart';
// // import 'package:api_address/services/api_add_address_service.dart';
// //
// // class AddAddressController extends GetxController {
// //
// //   final labelController = TextEditingController();
// //   final addressLineController = TextEditingController();
// //   final cityController = TextEditingController();
// //   final stateController = TextEditingController();
// //   final postalCodeController = TextEditingController();
// //   // final fullName = TextEditingController();
// //   final  latitude = TextEditingController();
// //   final longitude = TextEditingController();
// //   // final phoneNumber = TextEditingController();
// //
// //   final addAddressFormKey = GlobalKey<FormState>();
// //   final isLoading = false.obs;
// //
// //   final AddAddressRepository _repository = AddAddressRepository();
// //   final _storage = GetStorage();
// //
// //   String? validateRequired(String? value, String fieldName) {
// //     if (value == null || value.trim().isEmpty) {
// //       return '$fieldName is required';
// //     }
// //     return null;
// //   }
// //
// //   void saveAddress() async {
// //     if (!addAddressFormKey.currentState!.validate()) return;
// //
// //     isLoading.value = true;
// //
// //     final userId = _storage.read('userid');
// //     if (userId == null) {
// //       Get.snackbar('Error', 'User ID not found!');
// //       isLoading.value = false;
// //       return;
// //     }
// //
// //     try {
// //       final addressId = await _repository.addAddress(
// //         userId: userId,
// //         label: labelController.text.trim(),
// //         address: addressLineController.text.trim(),
// //         city: cityController.text.trim(),
// //         state: stateController.text.trim(),
// //         postalCode: postalCodeController.text.trim(),
// //         latitude: latitude.text.trim(),
// //         longitude: longitude.text.trim(),
// //         // fullName: fullName.text.trim(),
// //         // phoneNumber: phoneNumber.text.trim(),
// //
// //       );
// //
// //       Get.snackbar('Success', 'Address added, ID: $addressId');
// //     } catch (e) {
// //       Get.snackbar('Error', e.toString());
// //     } finally {
// //       isLoading.value = false;
// //     }
// //   }
// // }
