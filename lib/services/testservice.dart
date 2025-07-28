import 'package:api_address/config/app_constants.dart';
import 'package:dio/dio.dart';

class AddAddressRepository {
  final Dio _dio = Dio();

  Future<int> addAddress({
    required String city,
    required String label,
    required String state,
    required String address,
    required String postalCode,
    required String latitude,
    required String longitude,
    required String user_id,
  }) async {
    try {
      final response = await _dio.post(
        'https://rapiditadmin.mtai.live/api/user/address',
        // '${AppConstants.baseUrl}${AppConstants.postAddress}',

        data: {
          'user_id':user_id,
          'city': city,
          'label': label,
          'postalCode': postalCode,
          'state': state,
          'addressLine': address,
          'latitude': double.tryParse(latitude) ?? 0.0,
          'longitude': double.tryParse(longitude) ?? 0.0,
        },
        options: Options(headers: {
          'Content-Type': 'application/json',
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data['userid'] ?? 0;
      } else {
        throw Exception('Failed with status: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error adding address: $e');
    }
  }
}