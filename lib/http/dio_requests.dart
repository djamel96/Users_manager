import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

/// This two const are for server send and receive time out in [Seconds]
const int sendTimeOut = 30;
const int receiveTimeOut = 30;

/// Call this when the body is form data
Future<Response?> dioPostFormData({
  required String url,
  FormData? formData,
  Map<String, dynamic>? parameters,
}) async {
  Response? response;
  Dio dio = Dio();
  var header = {
    "Accept": 'application/json',
    "Authorization": "",
  };

  try {
    response = await dio.post(
      url,
      data: formData,
      queryParameters: parameters,
      options: Options(
          headers: header,
          sendTimeout: const Duration(seconds: sendTimeOut),
          receiveTimeout: const Duration(seconds: receiveTimeOut)),
    );
    return response;
  } on DioException catch (e) {
    // The request was made and the server responded with a status code
    // that falls out of the range of 2xx and is also not 304.
    if (e.type == DioExceptionType.connectionTimeout) {
      return e.response;
    }
    if (e.response != null) {
      return e.response;
    } else {
      return response;
    }
  }
}

/// Call this when the body is Json
Future<Response?> dioPostJson(
    {required String url, var data, Map<String, dynamic>? parameters}) async {
  Response? response;
  Dio dio = Dio();

  var header = {
    "Authorization": "",
    "Accept": 'application/json',
    "Content-Type": "application/json"
  };

  try {
    response = await dio.post(
      url,
      data: data,
      options: Options(
          headers: header,
          sendTimeout: const Duration(seconds: sendTimeOut),
          receiveTimeout: const Duration(seconds: receiveTimeOut)),
    );
    return response;
  } on DioException catch (e) {
    // The request was made and the server responded with a status code
    // that falls out of the range of 2xx and is also not 304.
    if (e.type == DioExceptionType.connectionTimeout) {
      return e.response;
    }
    if (e.response != null) {
      debugPrint(e.response!.statusCode.toString());
      debugPrint("response = ${e.response!.data}");
      debugPrint(e.response!.headers.toString());
      debugPrint(e.response!.requestOptions.toString());
      return e.response;
    } else {
      // Something happened in setting up or sending the request that triggered an Error
      debugPrint(e.requestOptions.toString());
      debugPrint(e.message.toString());
      return response;
    }
  }
}

/// Call this when for Get requests
Future<Response?> dioGet({
  required String url,
  Map<String, dynamic>? parameters,
  Map<String, dynamic>? data,
}) async {
  Response? response;
  Dio dio = Dio();

  var header = {
    "Authorization": '',
    "Accept": 'application/json',
    "Content-Type": "application/json"
  };

  try {
    response = await dio.get(url,
        data: data,
        options: Options(
            headers: header,
            sendTimeout: const Duration(seconds: sendTimeOut),
            receiveTimeout: const Duration(seconds: receiveTimeOut)),
        queryParameters: parameters);
    return response;
  } on DioException catch (e) {
    // The request was made and the server responded with a status code
    // that falls out of the range of 2xx and is also not 304.
    if (e.type == DioExceptionType.connectionTimeout) {
      debugPrint('time out');
      return e.response;
    }
    if (e.response != null) {
      debugPrint(e.response!.data.toString());
      debugPrint(e.response!.headers.toString());
      debugPrint(e.response!.requestOptions.toString());
      return e.response;
    } else {
      debugPrint(e.message.toString());
      return response;
    }
  }
}

/// Call this for update operations with a json body
Future<Response?> dioPutJson(
    {required String url, var data, Map<String, dynamic>? parameters}) async {
  Response? response;
  Dio dio = Dio();

  var header = {
    "Authorization": '',
    "Accept": 'application/json',
    "Content-Type": "application/json"
  };
  debugPrint(url);

  try {
    response = await dio.put(
      url,
      data: data,
      options: Options(
          headers: header,
          sendTimeout: const Duration(seconds: sendTimeOut),
          receiveTimeout: const Duration(seconds: receiveTimeOut)),
    );
    return response;
  } on DioException catch (e) {
    // The request was made and the server responded with a status code
    // that falls out of the range of 2xx and is also not 304.
    if (e.type == DioExceptionType.connectionTimeout) {
      return e.response;
    }
    if (e.response != null) {
      debugPrint(e.response!.statusCode.toString());
      debugPrint("response = ${e.response!.data}");
      debugPrint(e.response!.headers.toString());
      debugPrint(e.response!.requestOptions.toString());
      return e.response;
    } else {
      // Something happened in setting up or sending the request that triggered an Error

      debugPrint(e.message.toString());
      return response;
    }
  }
}

/// Call this for delete operations
Future<Response?> dioDelete({
  required String url,
  var data,
  Map<String, dynamic>? parameters,
}) async {
  Response? response;
  Dio dio = Dio();

  var header = {
    "Authorization": '',
    "Accept": 'application/json',
    "Content-Type": "application/json"
  };
  debugPrint(url.toString());

  try {
    response = await dio.delete(
      url,
      data: data,
      queryParameters: parameters,
      options: Options(
          headers: header,
          sendTimeout: const Duration(seconds: sendTimeOut),
          receiveTimeout: const Duration(seconds: receiveTimeOut)),
    );
    return response;
  } on DioException catch (e) {
    // The request was made and the server responded with a status code
    // that falls out of the range of 2xx and is also not 304.
    if (e.type == DioExceptionType.connectionTimeout) {
      return e.response;
    }
    if (e.response != null) {
      debugPrint(e.response!.statusCode.toString());
      debugPrint("response = ${e.response!.data}");
      debugPrint(e.response!.headers.toString());

      return e.response;
    } else {
      return response;
    }
  }
}
