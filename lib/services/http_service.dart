import 'dart:io';

import 'package:dio/dio.dart';
import 'package:rentafriend/app/app.logger.dart';
import 'package:rentafriend/services/environment_service.dart';

enum _HttpMethod { get, post, put, delete }

class HttpService {
  late final Dio _httpClient;

  final log = getLogger('HttpService');

  HttpService() {
    _httpClient = Dio(
      BaseOptions(
        receiveDataWhenStatusError: true,
        baseUrl: EnvironmentService.baseUrl,
      ),
    );
  }

  // Future<List<Course>> getCourses() async {
  //   final response = await _makeHttpRequest(
  //     method: _HttpMethod.get,
  //     path: '9e7938e8-92d1-4a4b-9ee8-6a95d8b6fee3',
  //   );

  //   if (response.statusCode != 200) return [];

  //   return List<Course>.from(response.data.map((c) => Course.fromJson(c)));
  // }

  // Future<Course> getCourse({required String id}) async {
  //   final response = await _makeHttpRequest(
  //     method: _HttpMethod.get,
  //     path: '01706ed5-636d-4a7d-96cb-dccb3d3d2d9d',
  //     queryParameters: {
  //       'id': id,
  //     },
  //   );

  //   if (response.statusCode != 200) {
  //     return Future.error(Exception(response.statusMessage));
  //   }

  //   return Course.fromJson(response.data);
  // }

  /// This method helps us avoid repetitive code for every request. This function Is in charge of building the request, calling the Api and handling errors.
  /// The type of the request we want to do is set with the method property and we use one of the values of the enum [_HttpMethod].
  /// The path is a String which sets the endpoint of the request in combination of baseUrl.
  /// This method does the following:
  /// - Build and Send the request
  /// - Return response or throw exception
  Future<Response> _makeHttpRequest({
    required _HttpMethod method,
    required String path,
    Map<String, dynamic> queryParameters = const {},
    Map<String, dynamic> body = const {},
    bool verbose = false,
    bool verboseResponse = false,
  }) async {
    try {
      final response = await _sendRequest(
        method: method,
        path: path,
        queryParameters: queryParameters,
        body: body,
      );

      final statusText = 'Status Code: ${response.statusCode}';
      final responseText = 'Response Data: ${response.data}';

      if (verbose) {
        log.v('$statusText${verboseResponse ? responseText : ''}');
      }

      return response;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.unknown && e.error is SocketException) {
        log.e(
          'This seems to be a network issue. Please check your network and try again.',
        );
        rethrow;
      }

      if (e.type == DioExceptionType.connectionTimeout) {
        log.e(
          'This seems to be a network issue. Please check your network and try again.',
        );
        rethrow;
      }

      log.e(
        'A response error occurred. ${e.response?.statusCode}\nERROR: ${e.message}',
      );
      rethrow;
    } catch (e) {
      log.e('Request to $path failed. Error details: $e');
      rethrow;
    }
  }

  Future<Response> _sendRequest({
    required _HttpMethod method,
    required String path,
    Map<String, dynamic> queryParameters = const {},
    Map<String, dynamic> body = const {},
  }) async {
    Response response;

    switch (method) {
      case _HttpMethod.post:
        response = await _httpClient.post(
          path,
          queryParameters: queryParameters,
          data: body,
        );
        break;
      case _HttpMethod.put:
        response = await _httpClient.put(
          path,
          queryParameters: queryParameters,
          data: body,
        );
        break;
      case _HttpMethod.delete:
        response = await _httpClient.delete(
          path,
          queryParameters: queryParameters,
        );
        break;
      case _HttpMethod.get:
      default:
        response = await _httpClient.get(
          path,
          queryParameters: queryParameters,
        );
    }

    return response;
  }
}
