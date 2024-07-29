import 'package:dio/dio.dart';

abstract class Failure {
  final String message;

  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);

  factory ServerFailure.fromDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.cancel:
        return ServerFailure("Request to API server was cancelled");
      case DioExceptionType.connectionTimeout:
        return ServerFailure("Connection time out with API server");
      case DioExceptionType.receiveTimeout:
        return ServerFailure("Receive time out with API server");
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            e.response!.statusCode!, e.response!.data);
      case DioExceptionType.sendTimeout:
        return ServerFailure("Send time out with API server");
      case DioExceptionType.unknown:
        return ServerFailure("Unexpected error occurred");
      case DioExceptionType.badCertificate:
        return ServerFailure("Bad certificate with API server");
      case DioExceptionType.connectionError:
        return ServerFailure("Connection error");
      default:
        return ServerFailure("Something went wrong");
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure( response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure( "Your request not found");
    } else if (statusCode == 500) {
      return ServerFailure( "Internal server error");
    } else {
      return ServerFailure( "Something went wrong");
    }
  }
}
