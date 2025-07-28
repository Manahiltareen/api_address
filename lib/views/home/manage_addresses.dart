import 'package:api_address/config/app_colors.dart';
import 'package:api_address/config/app_dimensions.dart';
import 'package:api_address/config/font_utils.dart';
import 'package:api_address/config/media_queries.dart';
import 'package:api_address/controllers/get_address_controller.dart';
import 'package:api_address/models/address_model.dart';
import 'package:api_address/views/home/testaddress.dart';
import 'package:api_address/views/shared/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManageAddressScreen extends StatelessWidget {
  ManageAddressScreen({Key? key}) : super(key: key);

  final AddressController addressController = Get.put(AddressController());

  @override
  Widget build(BuildContext context) {
    final double fabHeight = AppDimensions.buttonHeight +
        AppDimensions.paddingDefault * 2 +
        MediaQueries.responsivePadding(context) * 2;

    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.darkGrey),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Manage Address',
          style: FontUtils.appBarTitle.copyWith(color: AppColors.darkGrey),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle_outline, color: AppColors.primaryBlue, size: AppDimensions.iconSizeDefault),
            onPressed: () {
              Get.to(() => AddAddressScreen());
            },
          ),
        ],
      ),
      body: Obx(
            () {
          if (addressController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else if (addressController.errorMessage.isNotEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(AppDimensions.paddingDefault),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      addressController.errorMessage.value,
                      textAlign: TextAlign.center,
                      style: FontUtils.bodyText.copyWith(color: AppColors.errorRed),
                    ),
                    SizedBox(height: AppDimensions.paddingDefault),
                    ElevatedButton(
                      onPressed: () => addressController.fetchAddresses(),
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            );
          } else if (addressController.addresses.isEmpty) {
            return const Center(child: Text('No addresses found. Click + to add one.'));
          } else {
            return ListView.builder(
              padding: EdgeInsets.fromLTRB(
                MediaQueries.responsivePadding(context),
                0,
                MediaQueries.responsivePadding(context),
                fabHeight + AppDimensions.paddingDefault,
              ),
              itemCount: addressController.addresses.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      top: AppDimensions.paddingDefault,
                      bottom: AppDimensions.paddingSmall,
                    ),
                    child: Text(
                      'Your Addresses',
                      style: FontUtils.subheading1.copyWith(color: AppColors.darkGrey),
                    ),
                  );
                }
                final address = addressController.addresses[index - 1];
                return AddressCard(address: address);
              },
            );
          }
        },
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: MediaQueries.responsivePadding(context)),
        child: CustomWaveButton(
          text: 'Add New Address',
          onTap: () {
            Get.to(() => AddAddressScreen());
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class AddressCard extends StatelessWidget {
  final Address address;
  final AddressController addressController = Get.find();

  AddressCard({Key? key, required this.address}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
          () {
        final isSelected = addressController.selectedAddress.value?.id == address.id;
        return Card(
          margin: const EdgeInsets.only(bottom: AppDimensions.marginSmall),
          color: AppColors.cardBackground,
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.borderRadiusDefault),
            side: isSelected ? const BorderSide(color: AppColors.primaryBlue, width: 2) : BorderSide.none,
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(AppDimensions.borderRadiusDefault),
            onTap: () {
              addressController.selectAddress(address);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimensions.paddingDefault,
                vertical: AppDimensions.paddingSmall,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: AppDimensions.paddingSmall),
                    child: Icon(
                      Icons.location_on_outlined,
                      color: AppColors.primaryBlue,
                      size: AppDimensions.iconSizeDefault,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          address.label,
                          style: FontUtils.subheading2.copyWith(color: AppColors.darkGrey),
                        ),
                        const SizedBox(height: AppDimensions.paddingSmall / 2),
                        Text(
                          '${address.addressLine}, ${address.city}, ${address.state} - ${address.postalCode}',
                          style: FontUtils.bodyTextSmall.copyWith(color: AppColors.mediumGrey),
                        ),
                        const SizedBox(height: AppDimensions.paddingSmall / 2),
                        Text(
                          'Phone ${address.phoneNumber ?? 'null'}', 
                          style: FontUtils.bodyTextSmall.copyWith(color: AppColors.mediumGrey),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: AppDimensions.paddingSmall),
                    child: isSelected
                        ? const Icon(Icons.check_circle, color: AppColors.primaryBlue, size: AppDimensions.iconSizeDefault)
                        : const Icon(Icons.radio_button_off, color: AppColors.borderColor, size: AppDimensions.iconSizeDefault),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}