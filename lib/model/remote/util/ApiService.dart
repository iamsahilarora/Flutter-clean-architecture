/* Created by Sahil Bharti on 13/4/19.
 *
*/

import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/model/remote/ApiConstants.dart';
import 'package:flutter_clean_architecture/model/remote/requests/LoginRequest.dart';
import 'package:flutter_clean_architecture/model/remote/util/NetworkUtil.dart';

class ApiService {
  static ApiService _instance;
  static ApiService getInstance() {
    if (_instance == null) {
      return new ApiService();
    } else {
      return _instance;
    }
  }
  NetworkUtil networkUtil = NetworkUtil();


  Future<Response> login(LoginRequest loginRequest) {
     return networkUtil.post(ApiConstants.LOGIN, loginRequest.toMap());
  }


}
