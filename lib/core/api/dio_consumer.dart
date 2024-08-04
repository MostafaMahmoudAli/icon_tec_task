import 'package:dio/dio.dart';

import '../errors/exceptions.dart';
import 'api_consumer.dart';
import 'api_interceptors.dart';
import 'end_points.dart';

class DioConsumer implements ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    dio.options.baseUrl = EndPoints.baseUrl;
    dio.interceptors.add(DioInterceptor());
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      error: true,
    ));
  }

  @override
  Future get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      var response = await dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
      );
      return response.data;
    } catch (e) {
      if (e is DioException) {
        handelDioException(e);
      } else {
        return print("Un Expected Exception");
      }
    }
  }

  @override
  Future post(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    Options? options,
    bool isForm = false,
  }) async {
    try {
      var response = await dio.post(
        path,
        queryParameters: queryParameters,
        data: isForm ? FormData.fromMap(data!) : data,
        options: options,
      );
      return response.data;
    } catch (e) {
      if (e is DioException) {
        handelDioException(e);
      } else {
        return print("Un Expected Exception");
      }
    }
  }

  @override
  Future put(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    Options? options,
    bool isForm = false,
  }) async {
    try {
      var response = await dio.put(
        path,
        data: isForm ? FormData.fromMap(data!) : data,
        queryParameters: queryParameters,
        options: options,
      );
      return response.data;
    } catch (e) {
      if (e is DioException) {
        handelDioException(e);
      } else {
        return print("Un Expected Exception");
      }
    }
  }

  @override
  Future delete(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    bool isForm = false,
  }) async {
    try {
      var response = await dio.delete(
        path,
        queryParameters: queryParameters,
        options: options,
      );
      return response.data;
    } catch (e) {
      if (e is DioException) {
        handelDioException(e);
      } else {
        return print("Un Expected Exception");
      }
    }
  }
}
