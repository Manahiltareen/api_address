// // import 'package:api_address/controllers/AddAddressController.dart';
// //
// // import 'package:api_address/views/shared/custom_auth_header.dart';
// // import 'package:api_address/views/shared/custom_button.dart';
// // import 'package:api_address/views/shared/text_form_field.dart';
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// //
// // import 'package:api_address/config/app_colors.dart';
// // import 'package:api_address/config/app_dimensions.dart';
// // import 'package:api_address/config/font_utils.dart';
// //
// // class AddAddressScreen extends StatelessWidget {
// //   const AddAddressScreen({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     final AddAddressController controller = Get.put(AddAddressController());
// //
// //     return Scaffold(
// //       backgroundColor: AppColors.lightBackground,
// //       body: SingleChildScrollView(
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             CustomAuthHeader(
// //               title: 'Add New Address',
// //               showBackButton: true,
// //             ),
// //             Padding(
// //               padding: const EdgeInsets.symmetric(horizontal: AppDimensions.paddingLarge),
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   SizedBox(height: AppDimensions.paddingLarge),
// //                   Text(
// //                     'Enter Address Details',
// //                     style: FontUtils.heading2.copyWith(color: AppColors.darkGrey),
// //                   ),
// //                   SizedBox(height: AppDimensions.paddingLarge),
// //
// //                   AppTextFormField(
// //                     controller: controller.fullName.value,
// //                     hintText: 'full name (e.g., Manahil tareen)',
// //                     prefixIcon: FontAwesomeIcons.tag,
// //                     validationType: InputValidationType.name,
// //
// //                   ),
// //                   SizedBox(height: AppDimensions.paddingLarge),
// //
// //                   AppTextFormField(
// //                     controller: controller.label.value,
// //                     hintText: 'Label (e.g., Home)',
// //                     prefixIcon: FontAwesomeIcons.tag,
// //                     validationType: InputValidationType.name,
// //                   ),
// //                   SizedBox(height: AppDimensions.paddingDefault),
// //
// //                   AppTextFormField(
// //                     controller: controller.address.value,
// //                     hintText: 'Address Line',
// //                     prefixIcon: FontAwesomeIcons.house,
// //
// //                   ),
// //                   SizedBox(height: AppDimensions.paddingDefault),
// //
// //                   AppTextFormField(
// //                     controller: controller.city.value,
// //                     hintText: 'City',
// //                     prefixIcon: FontAwesomeIcons.building,
// //
// //                   ),
// //                   SizedBox(height: AppDimensions.paddingDefault),
// //
// //                   AppTextFormField(
// //                     controller: controller.state.value,
// //                     hintText: 'State',
// //                     prefixIcon: FontAwesomeIcons.locationDot,
// //
// //                   ),
// //                   SizedBox(height: AppDimensions.paddingDefault),
// //
// //                   AppTextFormField(
// //                     controller: controller.postalCode.value,
// //                     hintText: 'Postal Code',
// //                     prefixIcon: FontAwesomeIcons.envelope,
// //                     keyboardType: TextInputType.number,
// //
// //                   ),
// //                   SizedBox(height: AppDimensions.paddingDefault),
// //
// //                   AppTextFormField(
// //                     controller: controller.latitude.value,
// //                     hintText: 'Latitude',
// //                     prefixIcon: FontAwesomeIcons.mapPin,
// //                     keyboardType: TextInputType.number,
// //
// //                   ),
// //                   SizedBox(height: AppDimensions.paddingDefault),
// //
// //                   AppTextFormField(
// //                     controller: controller.longitude.value,
// //                     hintText: 'Longitude',
// //                     prefixIcon: FontAwesomeIcons.mapPin,
// //                     keyboardType: TextInputType.number,
// //
// //                   ),
// //                   SizedBox(height: AppDimensions.paddingLarge * 2),
// //
// //                   Center(
// //                     child: Obx(() => CustomWaveButton(
// //                       text: controller.isLoading.value ? 'Saving...' : 'Save Address',
// //                       onTap: (){controller.isLoading.value ? CircularProgressIndicator() : () => controller.submitAddress();},
// //                       width: MediaQuery.of(context).size.width * 0.9,
// //                     )),
// //                   ),
// //                   SizedBox(height: AppDimensions.paddingLarge),
// //                 ],
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
// import 'package:api_address/controllers/AddAddressController.dart';
// import 'package:api_address/views/shared/custom_auth_header.dart';
// import 'package:api_address/views/shared/custom_button.dart';
// import 'package:api_address/views/shared/text_form_field.dart';
//
//
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//
// import 'package:api_address/config/app_colors.dart';
// import 'package:api_address/config/app_dimensions.dart';
// import 'package:api_address/config/font_utils.dart';
//
// class AddAddressScreen extends StatelessWidget {
//   const AddAddressScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final AddAddressController controller = Get.put(AddAddressController());
//
//     return Scaffold(
//       backgroundColor: AppColors.lightBackground,
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             CustomAuthHeader(
//               title: 'Add New Address',
//               showBackButton: true,
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: AppDimensions.paddingLarge),
//               // IMPORTANT: Re-add the Form widget here
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   TextField(
//                     keyboardType: TextInputType.phone,
//                     decoration: InputDecoration(
//                       labelText: 'Mobile Number',
//                       hintText: "hint",
//                       border: OutlineInputBorder(),
//                     ),
//                     onChanged: (value) => controller.addressLine.value = value,
//                   ),
//                   TextField(
//                     keyboardType: TextInputType.phone,
//                     decoration: InputDecoration(
//                       labelText: 'Mobile Number',
//                       hintText: "hint",
//                       border: OutlineInputBorder(),
//                     ),
//                     onChanged: (value) => controller.latitude.value = value,
//                   ),
//                   TextField(
//                     keyboardType: TextInputType.phone,
//                     decoration: InputDecoration(
//                       labelText: 'Mobile Number',
//                       hintText: "hint",
//                       border: OutlineInputBorder(),
//                     ),
//                     onChanged: (value) => controller.longitude.value = value,
//                   ),
//                   TextField(
//                     keyboardType: TextInputType.phone,
//                     decoration: InputDecoration(
//                       labelText: 'Mobile Number',
//                       hintText: "hint",
//                       border: OutlineInputBorder(),
//                     ),
//                     onChanged: (value) => controller.postalCode.value = value,
//                   ),
//                   TextField(
//                     keyboardType: TextInputType.phone,
//                     decoration: InputDecoration(
//                       labelText: 'Mobile Number',
//                       hintText: "hint",
//                       border: OutlineInputBorder(),
//                     ),
//                     onChanged: (value) => controller.city.value = value,
//                   ),
//                   TextField(
//                     keyboardType: TextInputType.phone,
//                     decoration: InputDecoration(
//                       labelText: 'Mobile Number',
//                       hintText: "hint",
//                       border: OutlineInputBorder(),
//                     ),
//                     onChanged: (value) => controller.state.value = value,
//                   ),
//                   TextField(
//                     keyboardType: TextInputType.phone,
//                     decoration: InputDecoration(
//                       labelText: 'Mobile Number',
//                       hintText: "hint",
//                       border: OutlineInputBorder(),
//                     ),
//                     onChanged: (value) => controller.label.value = value,
//                   ),
//
//                   //   SizedBox(height: AppDimensions.paddingLarge),
//                 //   Text(
//                 //     'Enter Address Details',
//                 //     style: FontUtils.heading2.copyWith(color: AppColors.darkGrey),
//                 //   ),
//                 //   SizedBox(height: AppDimensions.paddingLarge),
//                 //
//                 //   // Corrected: Accessing fullNameController directly
//                 //   // Corrected: Added customValidator for required fields
//                 //   // AppTextFormField(
//                 //   //   controller: controller.fullName, // Corrected access
//                 //   //   hintText: 'Full Name (e.g., Manahil Tareen)', // Adjusted hint
//                 //   //   prefixIcon: FontAwesomeIcons.user, // Changed to user icon
//                 //   //   validationType: InputValidationType.name, // Use name validation
//                 //   //   customValidator: (value) => controller.validateRequired(value, 'Full Name'),
//                 //   // ),
//                 //   SizedBox(height: AppDimensions.paddingDefault), // Use paddingDefault for consistent spacing between fields
//                 //
//                 //   // Corrected: Accessing labelController directly
//                 //   // Corrected: Added customValidator
//                 //   AppTextFormField(
//                 //     onChanged: (value) => controller.mobileNumber.value = value,
//                 //     // Corrected access
//                 //     hintText: 'Label (e.g., Home)',
//                 //     prefixIcon: FontAwesomeIcons.tag,
//                 //     validationType: InputValidationType.normal, // Use normal for label
//                 //     customValidator: (value) => controller.validateRequired(value, 'Label'),
//                 //   ),
//                 //   SizedBox(height: AppDimensions.paddingDefault),
//                 //
//                 //   // Corrected: Accessing addressController directly
//                 //   // Corrected: Added customValidator
//                 //   AppTextFormField(
//                 //     controller: controller.addressLineController, // Corrected access
//                 //     hintText: 'Address Line',
//                 //     prefixIcon: FontAwesomeIcons.house,
//                 //     validationType: InputValidationType.normal, // Use normal
//                 //     customValidator: (value) => controller.validateRequired(value, 'Address Line'),
//                 //   ),
//                 //   SizedBox(height: AppDimensions.paddingDefault),
//                 //
//                 //   // Corrected: Accessing cityController directly
//                 //   // Corrected: Added customValidator
//                 //   AppTextFormField(
//                 //     controller: controller.cityController, // Corrected access
//                 //     hintText: 'City',
//                 //     prefixIcon: FontAwesomeIcons.building,
//                 //     validationType: InputValidationType.normal, // Use normal
//                 //     customValidator: (value) => controller.validateRequired(value, 'City'),
//                 //   ),
//                 //   SizedBox(height: AppDimensions.paddingDefault),
//                 //
//                 //   // Corrected: Accessing stateController directly
//                 //   // Corrected: Added customValidator
//                 //   AppTextFormField(
//                 //     controller: controller.stateController, // Corrected access
//                 //     hintText: 'State',
//                 //     prefixIcon: FontAwesomeIcons.mapLocationDot, // More specific icon for state
//                 //     validationType: InputValidationType.normal, // Use normal
//                 //     customValidator: (value) => controller.validateRequired(value, 'State'),
//                 //   ),
//                 //   SizedBox(height: AppDimensions.paddingDefault),
//                 //
//                 //   // Corrected: Accessing postalCodeController directly
//                 //   // Corrected: Added customValidator
//                 //   AppTextFormField(
//                 //     controller: controller.postalCodeController, // Corrected access
//                 //     hintText: 'Postal Code',
//                 //     prefixIcon: FontAwesomeIcons.envelope,
//                 //     keyboardType: TextInputType.number,
//                 //     validationType: InputValidationType.normal, // Use normal
//                 //     customValidator: (value) => controller.validateRequired(value, 'Postal Code'), // Using required as it's a number, but also required
//                 //   ),
//                 //   SizedBox(height: AppDimensions.paddingDefault),
//                 //
//                 //   // Corrected: Accessing latitudeController directly
//                 //   // Corrected: Added customValidator
//                 //   AppTextFormField(
//                 //     controller: controller.latitude, // Corrected access
//                 //     hintText: 'Latitude',
//                 //     prefixIcon: FontAwesomeIcons.mapPin,
//                 //     keyboardType: TextInputType.number,
//                 //     validationType: InputValidationType.normal, // Use normal (numeric handled by customValidator)
//                 //     // customValidator: (value) => controller.validateNumeric(value, 'Latitude'),
//                 //   ),
//                 //   SizedBox(height: AppDimensions.paddingDefault),
//                 //
//                 //   // Corrected: Accessing longitudeController directly
//                 //   // Corrected: Added customValidator
//                 //   AppTextFormField(
//                 //     controller: controller.longitude, // Corrected access
//                 //     hintText: 'Longitude',
//                 //     prefixIcon: FontAwesomeIcons.mapPin,
//                 //     keyboardType: TextInputType.number,
//                 //     validationType: InputValidationType.normal, // Use normal (numeric handled by customValidator)
//                 //     // customValidator: (value) => controller.validateNumeric(value, 'Longitude'),
//                 //   ),
//                   SizedBox(height: AppDimensions.paddingLarge * 2),
//
//                   // Center(
//                   //   child: Obx(
//                   //         () => CustomWaveButton(
//                   //       text: controller.isLoading.value ? 'Saving...' : 'Save Address',
//                   //       // Corrected: Proper onTap logic
//                   //       onTap:() {controller.isLoading.value
//                   //           ? null
//                   //           : () => controller.submitAddress(); },// Pass context
//                   //       width: MediaQuery.of(context).size.width * 0.9,
//                   //     ),
//                   //   ),
//                   // ),
//                   Obx(() => controller.isLoading.value
//                       ? CircularProgressIndicator()
//                       : ElevatedButton(
//                     onPressed: () {
//                       controller.submitAddress();
//                     },
//                     child: Text('Register'),
//                   )),
//
//                   SizedBox(height: AppDimensions.paddingLarge),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }