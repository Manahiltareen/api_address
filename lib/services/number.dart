import 'package:dio/dio.dart';

class RegistrationRepository {
  final Dio _dio = Dio();

  Future<int> registerUser(String mobileNumber) async {
    try {
      final response = await _dio.post(
        'https://rapiditadmin.mtai.live/api/rapidituser/register',
        data: {'mobile_number': mobileNumber},
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );

      if (response.statusCode == 201 ) {
        print('Response Data: ${response.data}');
        return response.data['userId'];

      } else {
        print('failed to register${response.statusMessage}');
        throw Exception('Failed to register: ${response.statusCode}');
      }
    } catch (e) {
      print("failed to register:${e.toString()}");
      throw Exception('Failed to register: $e');
    }
  }
}