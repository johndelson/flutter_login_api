import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:holedo_login/core/constants.dart';

class ApiClient {
  final Dio _dio = Dio();

  Future<dynamic> registerUser(Map<String, dynamic>? data) async {
    try {
      Response response = await _dio.post(
          'https://api.holedo.com/rest/users/register',
          data: data,
          queryParameters: {'apikey': ApiData.apiKey},
          options: Options(headers: {'X-LoginRadius-Sott': ApiData.sott}));
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }

  Future<dynamic> login(String email, String password) async {
    try {
      Response response = await _dio.post(
        'https://api.holedo.com/rest/users/login',
        data: {
          'email': email,
          'password': password,
        },
        queryParameters: {'apikey': ApiData.apiKey},
      );

      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }

  Future<dynamic> getUserProfileData(String accessToken) async {
    try {
      Response response = await _dio.get(
        'https://api.holedo.com/rest/users/me',
        queryParameters: {'apikey': ApiData.apiKey},
        options: Options(
          headers: {'AuthApi': 'Bearer $accessToken'},
        ),
      );
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }

  Future<dynamic> updateUserProfile({
    required String accessToken,
    required Map<String, dynamic> data,
  }) async {
    try {
      Response response = await _dio.put(
        'https://api.holedo.com/rest/users/account',
        data: data,
        queryParameters: {'apikey': ApiData.apiKey},
        options: Options(
          headers: {'AuthApi': 'Bearer $accessToken'},
        ),
      );
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }

  Future<dynamic> logout(String accessToken) async {
    try {
      Response response = await _dio.get(
        'https://api.holedo.com/rest/users/access_token/InValidate',
        queryParameters: {'apikey': ApiData.apiKey},
        options: Options(
          headers: {'AuthApi': 'Bearer $accessToken'},
        ),
      );
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }
}
