import 'package:dio/dio.dart';

import '../../../utils/config/app_info.dart';
import '../../../utils/errors/failures.dart';
import '../../../utils/extensions/extensions.dart';

class ApiService {
  static ApiService instance = ApiService();
  Dio dio = Dio();
  BaseOptions options = BaseOptions(
    baseUrl: AppInfo.baseUrl,
    receiveDataWhenStatusError: true,
    receiveTimeout: const Duration(seconds: 30),
    sendTimeout: const Duration(seconds: 30),
    headers: {
      'Accept-Language': "en",
      'Accept': 'application/json',
      'Authorization': "Bearer ",
      'Content-Type': 'multipart/form-data',
    },
  );

  Future get({
    required String endpoint,
    Object? data,
    Map<String, dynamic>? queryParameters,
    String? lang,
    String? token,
    bool hasHeaders = true,
    String? scannerToken,
  }) async {
    try {
      dio.options = options;
      var response = await dio.get(
        endpoint,
        data: data,
        queryParameters: queryParameters,
      );

      return response.data;
    } catch (error) {
      _catchError(error);
    }
  }

  Future post({
    required String endpoint,
    Object? data,
    bool isObject = true,
    Map<String, dynamic>? mapData,
    String? lang,
    String? token,
    Map<String, dynamic>? queryParameters,
    String? method,
    String? scannerToken,
    bool hasHeaders = true,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) async {
    try {
      dio.options = options;
      var response = await dio.post(
        endpoint,
        data: isObject ? data : mapData,
        queryParameters: queryParameters,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
       
      );
      return response.data;
    } catch (error) {
      _catchError(error, endPoint: endpoint);
    }
  }

  Future put({
    required String endpoint,
    required Map<String, dynamic>? data,
    String? lang,
    String? token,
    String? scannerToken,
    bool hasHeaders = true,
  }) async {
    try {
      dio.options = options;

      var response = await dio.put(
        endpoint,
        data: data,
     
      );
      return response.data;
    } catch (error) {
      _catchError(error);
    }
  }

  Future delete({
    required String endpoint,
    Map<String, dynamic>? data,
    String? lang,
    String? token,
    String? scannerToken,
    bool hasHeaders = true,
  }) async {
    try {
            dio.options = options;

      var response = await dio.delete(
        endpoint,
        data: data,
       
      );
      return response.data;
    } catch (error) {
      _catchError(error);
    }
  }


  _catchError(error, {String? endPoint}) {
    if (error is DioException) {
      if (error.response != null) {
        logError("$endPoint -${error.response?.statusCode} ");
        logError(error.response.toString());
        throw ServerFailure.fromResponse(
                error.response!.statusCode!, error.response!)
            .errorMessage;
      }
      throw ServerFailure.fromDioException(error).errorMessage;
    }
    throw error;
  }

  Future downloadPDF({required String url, required String savePath}) async {
    try {
      final response = await dio.download(
        url,
        savePath,
        options: Options(headers: {}),
      );

      return response;
    } catch (error) {
      _catchError(error);
    }
  }
}
