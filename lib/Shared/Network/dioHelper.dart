import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:petology_web/Shared/Network/customException.dart';
import 'package:petology_web/Shared/Network/dioException.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    try {
      dio = Dio(
        BaseOptions(
          baseUrl: 'https://petology.orangedigitalcenteregypt.com/',
          headers: {
            'Accept': 'application/json',
          },
          receiveDataWhenStatusError: true,
        ),
      );
    } on DioError catch (exception) {
      final errorMessage = DioExceptions.fromDioError(
        exception,
      ).errorType;

      throw CustomException(
        errorMessage,
        'error.png',
      );
    } catch (e) {
      throw CustomException(
        CustomStatusCodeErrorType.unExcepted,
        'error.png',
      );
    }
  }

  static Future<Response> getDate({
    required String url,
  }) async {
    try {
      return await dio.get(
        url,
      );
    } on DioError catch (exception) {
      if (kDebugMode) {
        print(
          "this is error from dio error exception$exception",
        );
      }

      if (kDebugMode) {
        print(
          "here is the error from dio  ${exception.response!.data["message"]} ",
        );
      }
      final errorType = DioExceptions.fromDioError(
        exception,
      ).errorType;
      final errorMessage = DioExceptions.fromDioError(
        exception,
      ).errorMassage;

      throw CustomException(
        errorType,
        'error.png',
        errorMassage: errorMessage,
      );
    } catch (e) {
      throw CustomException(
        CustomStatusCodeErrorType.unExcepted,
        'error.png',
      );
    }
  }

  static Future<Response> postData({
    required String url,
    required FormData data,
  }) async {
    try {
      final response = await dio.post(
        url,
        data: data,
        onSendProgress: (
          int sent,
          int total,
        ) {
          if (kDebugMode) {
            print(
              "$sent $total",
            );
          }
        },
      );

      if (kDebugMode) {
        print(
          response.statusCode.toString(),
        );
      }
      if (kDebugMode) {
        print(
          response.statusMessage,
        );
      }

      return response;
    } on DioError catch (exception) {
      if (kDebugMode) {
        print(
          "this is error from dio error exception$exception",
        );
      }
      if (kDebugMode) {
        print(
          "here is the error from dio  ${exception.response!.data["message"]} ",
        );
      }

      final errorType = DioExceptions.fromDioError(
        exception,
      ).errorType;

      final errorMessage = DioExceptions.fromDioError(
        exception,
      ).errorMassage;

      throw CustomException(
        errorType,
        'error.png',
        errorMassage: errorMessage,
      );
    } catch (error) {
      if (kDebugMode) {
        print(
          "this is error from unexpected exception$error",
        );
      }
      if (kDebugMode) {
        print(
          "this is error from unexpected exception${error.runtimeType}",
        );
      }

      throw CustomException(
        CustomStatusCodeErrorType.unExcepted,
        'error.png',
      );
    }
  }
}
