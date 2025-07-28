// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
//
//
// class AddAddressRepository{
//  final Dio _dio =Dio();
//  Future<int> addAddress(
//      {
//        // required int userId,
//        // required String fullName,
//        // required String phoneNumber,
//        required String city,
//        required String label,
//        required String state,
//        required String address,
//        required String postalCode,
//        required String latitude,
//        required String longitude,
//      }
//      ) async{
//
//     try{
//       final response = await _dio.post('https://rapiditadmin.mtai.live/api/user/address',
//           data: {
//             // 'user_id': userId,
//             // 'phone': phoneNumber,
//             'city': city,
//             'label': label,
//             'postalCode': 54000,
//             'state': state,
//             'addressLine': address,
//             'latitude': 31.5497,
//             'longitude': 74.3436,
//           },
//           options: Options(headers: {
//             'Content-type': 'application/json'
//           })
//       );
//       if(response.statusCode == 200 || response.statusCode == 201){
//         return response.data['userid'];
//
//       }
//       else {
//         throw Exception('Failed with status: ${response.statusCode}');
//       }
//     }
//     catch(e){
//       throw Exception('Error adding address: $e');
//     }
//
//  }
// }
//
//
//
