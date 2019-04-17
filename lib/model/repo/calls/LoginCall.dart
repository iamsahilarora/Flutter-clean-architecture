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

  LoginCall(LoginRequest request, BehaviorSubject<ApiResponse<LoginResponse>> responseSubject) : super(responseSubject) {this._request = request;}

  /// if return false then createApiAsyc is called
  /// if return true then loadFromDB Function  is called
  @override
  bool shouldFetchFromDB() {
    return false;
  }

  /// called when shouldFetchfromDB() is returning true
  @override
  void loadFromDB() {

    ///  get data from DB todo post/sinc on behaviourSubject after
  }
  /// called when shouldFetchfromDB() is returning false

  @override
  Future<Response> createApiAsync() {
    /// need to return APIService async task for API request
    return ApiService.getInstance().login(_request);
  }

  /// called when API Response is Success
  @override
  void onSuccess(LoginResponse response) {}

  /// called when API Response is success and need to parse JsonData to Model
  @override
  LoginResponse parseJson(Response response) {
    return LoginResponse.fromJson(response.data);
  }
}