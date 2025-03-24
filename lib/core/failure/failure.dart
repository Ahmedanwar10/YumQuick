import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

abstract class Failure {
  final String errorMessage;

  const Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioException(DioException dioException) {
    if (dioException.response != null) {
      final statusCode = dioException.response!.statusCode;
      final responseData = dioException.response!.data;
      if (statusCode != null) {
        return ServerFailure.fromResponse(statusCode, responseData);
      }
    }

    switch (dioException.type) {
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad certificate');

      case DioExceptionType.badResponse:
        return ServerFailure('Bad response from server');

      case DioExceptionType.cancel:
        return ServerFailure('Request was canceled');

      case DioExceptionType.connectionError:
        return ServerFailure(Intl.getCurrentLocale() == 'ar'
            ? 'لا يوجد اتصال بالإنترنت'
            : 'No Internet Connection');

      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        return ServerFailure(Intl.getCurrentLocale() == 'ar'
            ? 'تعذر الاتصال بالخادم'
            : 'Connection timeout with the API server');

      case DioExceptionType.unknown:
        if (dioException.message?.contains('SocketException') ?? false) {
          return ServerFailure(Intl.getCurrentLocale() == 'ar'
              ? 'لا يوجد اتصال بالإنترنت'
              : 'No Internet Connection');
        }
        return ServerFailure(Intl.getCurrentLocale() == 'ar'
            ? 'حدث خطأ غير متوقع. حاول مرة أخرى'
            : 'Unexpected error, try again');

      default:
        return ServerFailure(Intl.getCurrentLocale() == 'ar'
            ? 'حدث خطأ غير متوقع. حاول مرة أخرى'
            : 'Unexpected error, try again');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (response is Map && response.containsKey('msg')) {
      final message = response['msg'];
      if (message is Map) {
        return ServerFailure(
          message.values.expand((e) => e is List ? e : [e]).first.toString(),
        );
      } else if (message is String) {
        return ServerFailure(message);
      }
    }

    if (statusCode == 404) {
      return ServerFailure(Intl.getCurrentLocale() == 'ar'
          ? 'الطلب غير موجود'
          : 'Request not found, try again later');
    } else if (statusCode == 500) {
      return ServerFailure(Intl.getCurrentLocale() == 'ar'
          ? 'خطأ في الخادم'
          : 'Internal server error, try again later');
    }

    return ServerFailure(Intl.getCurrentLocale() == 'ar'
        ? 'حدث خطأ غير متوقع. حاول مرة أخرى'
        : 'Unexpected error, try again');
  }
}