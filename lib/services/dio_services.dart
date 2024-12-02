import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pg/constants/app_constant.dart';

class DioServices {
  static Dio? _dio;

  static Dio get dio {
    _dio ??= Dio();

    _dio!.options.validateStatus = (status) {
      return status! < 500;
    };
    return _dio!;
  }

  static String host = AppConstant.baseUrl;

  static Future<Response> get(String endpoint,
      {Map<String, dynamic>? headers,
      Map<String, dynamic>? queryParameters}) async {
    final url = "$host/$endpoint";
    print(url);
    print(queryParameters);

    try {
      final response = await dio.get(url,
          options: Options(headers: headers), queryParameters: queryParameters);
      print(response.statusCode);
      return response;
    } catch (e) {
      print("This is the error: $e");
      throw Exception('GET request failed: $e');
    }
  }

  static Future<Response> postRequest(String endpoint, dynamic data) async {
    final url = "$host/$endpoint";
    print(url);
    print(jsonEncode(data));

    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };

    try {
      final response = await dio.post(url,
          data: jsonEncode(data),
          options: Options(
              method: "POST",
              receiveDataWhenStatusError: false,
              headers: headers));
      return response;
    } catch (e) {
      print("Error is $e");
      throw Exception('POST request failed: $e');
    }
  }

  static Future<Response> put(String endpoint, dynamic data) async {
    try {
      var headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      };
      final url = "$host/$endpoint";
      final response = await dio.put(url,
          data: jsonEncode(data),
          options: Options(
              method: "PUT",
              receiveDataWhenStatusError: true,
              headers: headers));
      return response;
    } catch (e) {
      throw Exception('PUT request failed: $e');
    }
  }

  static Future<Response> delete(
    String endpoint, {
    Map<String, dynamic>? headers,
  }) async {
    final url = "$host/$endpoint";
    print(url);

    try {
      final response = await dio.delete(url, options: Options(headers: headers));
      print(response.statusCode);
      return response;
    } catch (e) {
      print("This is the error: $e");
      throw Exception('DELETE request failed: $e');
    }
  }

  static dynamic dioResponseHandler(response) {
    Map<String, dynamic> responseData = json.decode(response.toString());
    return responseData;
  }
}
