import 'package:api_address/config/app_constants.dart';
import 'package:dio/dio.dart';

import 'package:dio/dio.dart';

class AddAddressRepository {
  final Dio _dio = Dio();

  Future<Response> addAddress(Map<String, dynamic> body) async {
    try {
      print('body:${body}');
      final response = await _dio.post(
        'https://rapiditadmin.mtai.live/api/user/address',
        data: body,
        options: Options(headers: {
          "Content-Type": "application/json",
        }),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data['userid'] ?? 0;
      } else {
        print('Failed with status:-${response.statusMessage}');
        throw Exception('Failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('error:${e.toString()}');
      throw Exception('Error adding address: $e');
    }
  }

}

