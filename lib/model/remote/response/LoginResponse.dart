/* Created by Sahil Bharti on 13/4/19.
 *
*/
import 'package:flutter_clean_architecture/model/beans/User.dart';
import 'package:flutter_clean_architecture/model/remote/response/GeneralResponse.dart';

class LoginResponse extends GeneralResponse {
  User Result;

  LoginResponse.fromJson(Map<String, dynamic> json)
      : Result = User.fromJson(json["Result"]),
        super.fromJson(json);

}
