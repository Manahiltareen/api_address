import 'package:api_address/controllers/AddAddressController.dart';
import 'package:api_address/controllers/get_address_controller.dart';
import 'package:api_address/controllers/testaddresscontroll.dart';
import 'package:api_address/views/home/manage_addresses.dart';
import 'package:api_address/views/shared/custom_address_field.dart';
import 'package:api_address/views/shared/custom_button.dart';
import 'package:api_address/views/shared/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:api_address/config/app_colors.dart';
import 'package:api_address/config/app_dimensions.dart';
import 'package:api_address/config/font_utils.dart';

class AddAddressScreen extends StatelessWidget {
  const AddAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // controllers name meaning full
    AddressController addressController=Get.put(AddressController());
    final AddAddressController controller = Get.put(AddAddressController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: AppDimensions.paddingDefault),
          child: Container(

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppDimensions.borderRadiusSmall),
              color: AppColors.primaryBlue,

            ),
            width: AppDimensions.iconSizeDefault,
            height: AppDimensions.iconSizeDefault,
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: AppDimensions.iconSizeLarge), // Arrow color: White
              onPressed: () => Get.back(),

              splashRadius: 24,
            ),
          ),
        ),
        title: Text(
          'Add New Address',
          style: FontUtils.subheading1.copyWith(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: (){
              Get.to(ManageAddressScreen());
            },
            child: Text('See Address',
              style: FontUtils.hintText.copyWith(color: AppColors.primaryBlue),),

          ),
        ],
      ),

      backgroundColor: AppColors.lightBackground,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppDimensions.paddingLarge),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: AppDimensions.paddingLarge),
                  Text(
                    'Enter Address Details',
                    style: FontUtils.subheading1.copyWith(color: AppColors.primaryBlue),
                  ),
                  SizedBox(height: AppDimensions.paddingLarge),


                  CustomAddressField(
                    hintText: 'Label (e.g., Home)',
                    prefixIcon: FontAwesomeIcons.tag,
                    validationType: InputValidationType.normal,
                    onChanged: (value) => controller.label.value = value,

                  ),
                  SizedBox(height: AppDimensions.paddingDefault),

                  CustomAddressField(
                    hintText: 'Address Line',
                    prefixIcon: FontAwesomeIcons.house,
                    validationType: InputValidationType.normal,
                    onChanged: (value) => controller.addressLine.value = value,

                  ),
                  SizedBox(height: AppDimensions.paddingDefault),
TextFormField(
  controller: addressController.na,
)
                  AppTextFormField(
                    controller: addressController.,

                    hintText: 'City',
                    prefixIcon: FontAwesomeIcons.building,
                    validationType: InputValidationType.normal,
                    onChanged: (value) => controller.city.value = value,

                  ),
                  SizedBox(height: AppDimensions.paddingDefault),

                  CustomAddressField(
                    hintText: 'State',
                    prefixIcon: FontAwesomeIcons.mapLocationDot,
                    validationType: InputValidationType.normal,
                    onChanged: (value) => controller.state.value = value,

                  ),
                  SizedBox(height: AppDimensions.paddingDefault),

                  CustomAddressField(
                    hintText: 'Postal Code',
                    prefixIcon: FontAwesomeIcons.envelope,
                    keyboardType: TextInputType.number,
                    validationType: InputValidationType.normal,
                    onChanged: (value) => controller.postalCode.value = value,

                  ),
                  SizedBox(height: AppDimensions.paddingDefault),

                  CustomAddressField(
                    hintText: 'Latitude',
                    prefixIcon: FontAwesomeIcons.mapPin,
                    keyboardType: TextInputType.number,
                    validationType: InputValidationType.normal,
                    onChanged: (value) => controller.latitude.value = value,

                  ),
                  SizedBox(height: AppDimensions.paddingDefault),

                  CustomAddressField(
                    hintText: 'Longitude',
                    prefixIcon: FontAwesomeIcons.mapPin,
                    keyboardType: TextInputType.number,
                    validationType: InputValidationType.normal,
                    onChanged: (value) => controller.longitude.value = value,

                  ),
                  SizedBox(height: AppDimensions.paddingLarge),

                  CustomAddressField(
                    hintText: 'User ID',
                    prefixIcon: FontAwesomeIcons.idCard,
                    keyboardType: TextInputType.number,
                    validationType: InputValidationType.normal,
                    onChanged: (value) => controller.user_id.value = value,

                  ),
                  SizedBox(height: AppDimensions.paddingLarge * 2),

                  Center(
                    child: Obx(
                          () => controller.isLoading.value
                          ? CircularProgressIndicator()
                          : CustomWaveButton(
                        text: 'Save Address',
                        onTap: () {
                          // Directly call submitAddress; it handles its own validation now
                          controller.submitAddress();
                        },
                        width: MediaQuery.of(context).size.width * 0.9,
                      ),
                    ),
                  ),
                  SizedBox(height: AppDimensions.paddingLarge),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}












class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    AddAddressController addressController=Get.put(AddAddressController());
    return Scaffold(
      body: TextFormField(
        controller: addressController.nameController,
      ),
    );
  }
}



