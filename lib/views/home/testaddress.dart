import 'package:api_address/controllers/AddAddressController.dart';
import 'package:api_address/views/home/manage_addresses.dart';
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
              icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: AppDimensions.iconSizeLarge),
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
            onPressed: () {
              Get.to(ManageAddressScreen());
            },
            child: Text(
              'See Address',
              style: FontUtils.hintText.copyWith(color: AppColors.primaryBlue),
            ),
          ),
        ],
      ),
      backgroundColor: AppColors.lightBackground,
      body: SingleChildScrollView(
        child: Padding(
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

              AppTextFormField(
                controller: controller.label,
                hintText: 'Label (e.g., Home)',
                prefixIcon: FontAwesomeIcons.tag,
              ),
              SizedBox(height: AppDimensions.paddingDefault),

              AppTextFormField(
                controller: controller.addressLine,
                hintText: 'Address Line',
                prefixIcon: FontAwesomeIcons.house,
              ),
              SizedBox(height: AppDimensions.paddingDefault),

              AppTextFormField(
                controller: controller.city,
                hintText: 'City',
                prefixIcon: FontAwesomeIcons.building,
              ),
              SizedBox(height: AppDimensions.paddingDefault),

              AppTextFormField(
                controller: controller.state,
                hintText: 'State',
                prefixIcon: FontAwesomeIcons.mapLocationDot,
              ),
              SizedBox(height: AppDimensions.paddingDefault),

              AppTextFormField(
                controller: controller.postalCode,
                hintText: 'Postal Code',
                keyboardType: TextInputType.number,
                prefixIcon: FontAwesomeIcons.envelope,
              ),
              SizedBox(height: AppDimensions.paddingDefault),

              AppTextFormField(
                controller: controller.latitude,
                hintText: 'Latitude',
                keyboardType: TextInputType.number,
                prefixIcon: FontAwesomeIcons.mapPin,
              ),
              SizedBox(height: AppDimensions.paddingDefault),

              AppTextFormField(
                controller: controller.longitude,
                hintText: 'Longitude',
                keyboardType: TextInputType.number,
                prefixIcon: FontAwesomeIcons.mapPin,
              ),
              SizedBox(height: AppDimensions.paddingDefault),

              AppTextFormField(
                controller: controller.phoneNumber,
                hintText: 'Phone Number',
                keyboardType: TextInputType.phone,
                prefixIcon: FontAwesomeIcons.phone,
              ),
              SizedBox(height: AppDimensions.paddingLarge * 2),

              Center(
                child: Obx(
                      () => controller.isLoading.value
                      ? CircularProgressIndicator()
                      : CustomWaveButton(
                    text: 'Save Address',
                    onTap: () {
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
      ),
    );
  }
}
