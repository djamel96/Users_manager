import 'dart:developer';

import 'package:charlie/http/api.dart';
import 'package:charlie/http/dio_requests.dart';
import 'package:charlie/http/server_response.dart';
import 'package:dio/dio.dart';

Future<ServerResponse> fetchUsersService(
    {required Map<String, dynamic> parameters}) async {
  try {
    log("fetchUsersService called");
    log(parameters.toString());
    Response? response =
        await dioGet(url: Api.fetchUsers, parameters: parameters);
    if (response == null) return ServerResponse.defaultError();
    if (successResponse(response.statusCode)) {
      return ServerResponse.defaultSuccess(
        value: response.data,
      );
    } else {
      return ServerResponse.defaultError();
    }
  } catch (e) {
    return ServerResponse.defaultError();
  }
}
