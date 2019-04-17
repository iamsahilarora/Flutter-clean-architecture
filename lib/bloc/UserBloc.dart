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
  final BehaviorSubject<ApiResponse<LoginResponse>> _subjectLogin =
      BehaviorSubject<ApiResponse<LoginResponse>>();

  /// Functions/Methods of get Data from Repository either from db/network
  executeLogin(LoginRequest request) {
    _repository.executeLogin(request, _subjectLogin);
  }

  /// getter of Subject to access outside of class
  BehaviorSubject<ApiResponse<LoginResponse>> get subject => _subjectLogin;

  /// functions that used to  close the Subject stream
  disposeLoginSubject() {
    _subjectLogin.close();
  }
}

///final Object of User Bloc
final userBloc = UserBloc();
