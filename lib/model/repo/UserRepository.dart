/* Created by Sahil Bharti on 13/4/19.
 *
*/


import 'package:flutter_clean_architecture/model/remote/requests/LoginRequest.dart';
import 'package:flutter_clean_architecture/model/remote/response/LoginResponse.dart';
import 'package:flutter_clean_architecture/model/remote/util/ApiResponse.dart';
import 'package:flutter_clean_architecture/model/repo/calls/LoginCall.dart';
import 'package:rxdart/rxdart.dart';

class UserRepository {

  /// create new Call  for getData  and execute the call and post it on given BehaviorSubject.
  /// params 1. request -> request data for api
  /// params 2. BehaviourSubject -> in which data is sinc/post
  executeLogin(LoginRequest request,
      BehaviorSubject<ApiResponse<LoginResponse>> responseSubject) {
    new LoginCall(request, responseSubject).execute();
  }

}




