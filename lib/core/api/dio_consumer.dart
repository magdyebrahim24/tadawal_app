import 'dart:convert';
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:tadawal/core/api/api_consumer.dart';
import 'package:tadawal/core/api/app_interceptor.dart';
import 'package:tadawal/core/api/end_point.dart';
import 'package:tadawal/core/api/status_code.dart';
import 'package:tadawal/core/error/exceptions.dart';
import 'package:tadawal/injection_container.dart' as di;

class DioConsumer implements ApiConsumer {
  final Dio client;

  DioConsumer({required this.client}) {
    (client.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    client.options
      ..baseUrl = EndPoints.baseUrl
      ..responseType = ResponseType.plain
      ..followRedirects = false
      ..validateStatus = (status) {
        return status! < StatusCodes.internalServerError;
      };

    client.interceptors.add(di.sl<AppInterceptors>());
    if (kDebugMode) {
      client.interceptors.add(di.sl<LogInterceptor>());
    }
  }

  @override
  Future get(
      {required String path, Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await client.get(path, queryParameters: queryParameters);
      return _handelResponseAsJson(response);
    } on DioError catch (error) {
      return _handleDioError(error);
    }
  }

  @override
  Future post(
      {required String path,
      Map<String, dynamic>? body,
      bool formDataIsEnabled = false,
      Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await client.post(path,
          data: formDataIsEnabled ? FormData.fromMap(body!) : body,
          queryParameters: queryParameters);
      return _handelResponseAsJson(response);
    } on DioError catch (error) {
      return _handleDioError(error);
    }
  }

  @override
  Future put(
      {required String path,
      Map<String, dynamic>? body,
      bool formDataIsEnabled = false,
      Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await client.put(path,
          data: formDataIsEnabled ? FormData.fromMap(body!) : body,
          queryParameters: queryParameters);
      return _handelResponseAsJson(response);
    } on DioError catch (error) {
      return _handleDioError(error);
    }
  }

  dynamic _handelResponseAsJson(Response<dynamic> response) {
    final responseJson = jsonDecode(response.data.toString());
    return responseJson;
  }

  dynamic _handleDioError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        throw const FetchDataException();
      case DioErrorType.response:
        switch (error.response?.statusCode) {
          case StatusCodes.badRequest:
            throw const BadRequestException();
          case StatusCodes.unauthorized:
          case StatusCodes.forbidden:
            throw const UnauthorizedException();
          case StatusCodes.notFound:
            throw const NotFoundException();
          case StatusCodes.conflict:
            throw const ConflictException();

          case StatusCodes.internalServerError:
            throw const InternalServerErrorException();
        }
        break;
      case DioErrorType.cancel:
        break;
      case DioErrorType.other:
        throw const NoInternetConnectionException();
    }
  }
}
