import 'package:dio/dio.dart';


abstract class Failure {
  final String errorMessage;
  final List? error;

  Failure(this.errorMessage, {this.error});
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage, {super.error});

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.sendTimeout:
       

        return ServerFailure("send Time out");
      case DioExceptionType.receiveTimeout:

        return ServerFailure("receive Time out");
      case DioExceptionType.cancel:

        return ServerFailure("cancel Request");
      case DioExceptionType.connectionTimeout:

        return ServerFailure("connection Time Out");
      case DioExceptionType.badCertificate:

        return ServerFailure("bad Certid irate");
      case DioExceptionType.badResponse:

        return ServerFailure("bad Response");
      case DioExceptionType.connectionError:

        return ServerFailure("connection Error");
      case DioExceptionType.unknown:

        return ServerFailure("Unknown Error");
      default:

        return ServerFailure("Unknown Error");
    }
  }

  factory ServerFailure.fromResponse(int statusCode, Response<dynamic> response) {
    List<dynamic> serverFailureErrors = [];
    String serverFailureMessage = '';
    if (statusCode == 200) {
      if (response.data['status'] == false) {
        if (response.data.containsKey('errors')) {
          if (response.data.containsKey('errors') is String) {
            serverFailureErrors = [];
          } else {
            serverFailureErrors = convertErrorFromMapToList(response.data['errors']);
          }
        }
        if (response.data.containsKey('message')) {
          List<dynamic> errorsSms = [];
          if (response.data["message"] is String) {
            errorsSms = [];
            serverFailureMessage = response.data["message"] ?? "";
          } else {
            errorsSms = convertErrorFromMapToList(response.data["message"]);
            serverFailureMessage = errorsSms.toList().join('\n');
          }
        }
        if (serverFailureErrors.isEmpty && serverFailureMessage.isEmpty) {

          return ServerFailure("status code:$statusCode\nPlease Try Again Later");
        } else {

          return ServerFailure(serverFailureMessage.isNotEmpty ? serverFailureMessage : serverFailureErrors.toList().join('\n'));
        }
      }
    } else if (statusCode == 422) {
      if (response.data.containsKey('errors')) {
        if (response.data.containsKey('errors') is String) {
          serverFailureErrors = [];
        } else {
          serverFailureErrors = convertErrorFromMapToList(response.data['errors']);
        }
      }
      if (response.data.containsKey("message")) {
        List<dynamic> errorsSms = [];
        if (response.data["message"] is String) {
          errorsSms = [];
          serverFailureMessage = response.data["message"] ?? "";
        } else {
          errorsSms = convertErrorFromMapToList(response.data["message"]);
          serverFailureMessage = errorsSms.toList().join('\n');
        }
      }
      if (serverFailureErrors.isEmpty && serverFailureMessage.isEmpty) {

        return ServerFailure("status code:$statusCode\nPlease Try Again Later");
      } else {

        return ServerFailure(serverFailureMessage.isNotEmpty ? serverFailureMessage : serverFailureErrors.toList().join('\n'));
      }
    } else if (statusCode == 401) {
      if (response.data.containsKey('errors')) {
        if (response.data.containsKey('errors') is String) {
          serverFailureErrors = [];
        } else {
          serverFailureErrors = convertErrorFromMapToList(response.data['errors']);
        }
      }
      if (response.data.containsKey("message")) {
        List<dynamic> errorsSms = [];
        if (response.data["message"] is String) {
          errorsSms = [];
          serverFailureMessage = response.data["message"] ?? "";
        } else {
          errorsSms = convertErrorFromMapToList(response.data["message"]);
          serverFailureMessage = errorsSms.toList().join('\n');
        }
      }
      if (serverFailureErrors.isEmpty && serverFailureMessage.isEmpty) {

        return ServerFailure("status code:$statusCode\nUnauthenticated");
      } else {

        return ServerFailure(serverFailureMessage.isNotEmpty ? serverFailureMessage : serverFailureErrors.toList().join('\n'));
      }
    } else if (statusCode == 403) {
      if (response.data.containsKey('errors')) {
        if (response.data.containsKey('errors') is String) {
          serverFailureErrors = [];
        } else {
          serverFailureErrors = convertErrorFromMapToList(response.data['errors']);
        }
      }
      if (response.data.containsKey("message")) {
        List<dynamic> errorsSms = [];
        if (response.data["message"] is String) {
          errorsSms = [];
          serverFailureMessage = response.data["message"] ?? "";
        } else {
          errorsSms = convertErrorFromMapToList(response.data["message"]);
          serverFailureMessage = errorsSms.toList().join('\n');
        }
      }
      if (serverFailureErrors.isEmpty && serverFailureMessage.isEmpty) {

        return ServerFailure("status code:$statusCode\nNot Have Permission");
      } else {

        return ServerFailure(serverFailureMessage.isNotEmpty ? serverFailureMessage : serverFailureErrors.toList().join('\n'));
      }
    } else if (statusCode == 404) {
      if (response.data.containsKey('errors')) {
        if (response.data.containsKey('errors') is String) {
          serverFailureErrors = [];
        } else {
          serverFailureErrors = convertErrorFromMapToList(response.data['errors']);
        }
      }
      if (response.data.containsKey("message")) {
        List<dynamic> errorsSms = [];
        if (response.data["message"] is String) {
          errorsSms = [];
          serverFailureMessage = response.data["message"] ?? "";
        } else {
          errorsSms = convertErrorFromMapToList(response.data["message"]);
          serverFailureMessage = errorsSms.toList().join('\n');
        }
      }
      if (serverFailureErrors.isEmpty && serverFailureMessage.isEmpty) {

        return ServerFailure("status code:$statusCode\nResponse Not Found");
      } else {

        return ServerFailure(serverFailureMessage.isNotEmpty ? serverFailureMessage : serverFailureErrors.toList().join('\n'));
      }
    } else if (statusCode == 500) {
      if (response.data.containsKey('errors')) {
        if (response.data.containsKey('errors') is String) {
          serverFailureErrors = [];
        } else {
          serverFailureErrors = convertErrorFromMapToList(response.data['errors']);
        }
      }
      if (response.data.containsKey("message")) {
        List<dynamic> errorsSms = [];
        if (response.data["message"] is String) {
          errorsSms = [];
          serverFailureMessage = response.data["message"] ?? "";
        } else {
          errorsSms = convertErrorFromMapToList(response.data["message"]);
          serverFailureMessage = errorsSms.toList().join('\n');
        }
      }
      if (serverFailureErrors.isEmpty && serverFailureMessage.isEmpty) {

        return ServerFailure("Internal Server Error");
      } else {

        return ServerFailure(serverFailureMessage.isNotEmpty ? serverFailureMessage : serverFailureErrors.toList().join('\n'));
      }
    }

    return ServerFailure(response.data['message'] ?? "status code:$statusCode\nPlease Try Again Later");
  }
}

List<dynamic> convertErrorFromMapToList(Map errors) {
  List<dynamic> err = [];
  errors.forEach(
    (key, value) {
      if (value is List) {
        err.add(value.toString().substring(1, value.toString().length - 1).toString());
      } else {
        err.add(value.toString());
      }
    },
  );
  return err;
}
