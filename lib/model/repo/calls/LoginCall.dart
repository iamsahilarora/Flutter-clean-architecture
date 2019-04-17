/* Created by Sahil Bharti on 17/4/19.
 *
*/

import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/model/remote/requests/LoginRequest.dart';
import 'package:flutter_clean_architecture/model/remote/response/LoginResponse.dart';
import 'package:flutter_clean_architecture/model/remote/util/ApiResponse.dart';
import 'package:flutter_clean_architecture/model/remote/util/ApiService.dart';
import 'package:flutter_clean_architecture/model/remote/util/DataFetchCall.dart';
import 'package:rxdart/rxdart.dart';

class LoginCall extends DataFetchCall<LoginResponse> {
  LoginRequest _request;

  LoginCall(LoginRequest request,
      BehaviorSubject<ApiResponse<LoginResponse>> responseSubject)
      : super(responseSubject) {
    this._request = request;
  }

  @override
  bool shouldFetchFromDB() {
    return false;
  }

  @override
  void loadFromDB() {}

  @override
  Future<Response> createApiAsync() {
    return ApiService.getInstance().login(_request);
  }

  @override
  void onSuccess(LoginResponse response) {}

  @override
  LoginResponse parseJson(Response response) {
    return LoginResponse.fromJson(response.data);
  }
}