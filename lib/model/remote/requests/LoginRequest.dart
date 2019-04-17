/* Created by Sahil Bharti on 13/4/19.
 *
*/
class LoginRequest {
  String email;
  String password;

  LoginRequest(this.email, this.password);

  Map<String, String> toMap() {
    Map<String, String> map = new Map();
    map["email"] = email;
    map["password"] = email;
    return map;
  }
}
