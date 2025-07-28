import 'package:dio/dio.dart';
import 'package:api_address/models/address_model.dart';
import 'package:api_address/config/app_constants.dart';

class AddressService {
  final Dio _dio = Dio();



  Future<List<Address>> fetchAddresses() async {
    try {
      final response = await _dio.get('${AppConstants.baseUrl}${AppConstants.getAddress}');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => Address.fromJson(json)).toList();
      } else {

        throw Exception(
         'Failed to load addresses with status code: ${response.statusCode}',
        );
      }
    } catch (e) {

      throw Exception('Error adding address: $e');
    }
  }


}