/* Created by Sahil Bharti on 13/4/19.
 *
*/
import 'package:flutter_clean_architecture/model/remote/requests/LoginRequest.dart';
import 'package:flutter_clean_architecture/model/remote/response/LoginResponse.dart';
import 'package:flutter_clean_architecture/model/remote/util/ApiResponse.dart';
import 'package:flutter_clean_architecture/model/repo/UserRepository.dart';
import 'package:rxdart/rxdart.dart';

class UserBloc {

  final UserRepository _repository = UserRepository();
  final BehaviorSubject<
      ApiResponse<LoginResponse>> _subjectLogin = BehaviorSubject<
      ApiResponse<LoginResponse>>();

  executeLogin(LoginRequest request) {
    _repository.executeLogin(request, _subjectLogin);
  }

  BehaviorSubject<ApiResponse<LoginResponse>> get subject => _subjectLogin;

  disposeLoginSubject() {
    _subjectLogin.close();
  }
  
}


final userBloc = UserBloc();
