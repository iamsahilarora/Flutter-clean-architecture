/* Created by Sahil Bharti on 13/4/19.
 *
*/
class User {
  final int id;
  final String name;
  final String email;
  final String password;
  final String mobileNumber;
  final String message;

  User(this.id, this.name, this.email, this.password, this.mobileNumber,this.message);

  User.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        email = json["email"],
        password = json["password"],
        mobileNumber = json["mobile_number"],
        message = json["message"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['password'] = this.password;
    data['name'] = this.name;
    data['id'] = this.id;
    data['message'] = this.message;
    data['mobile_number'] = this.mobileNumber;
    data['email'] = this.email;
    return data;
  }
}
