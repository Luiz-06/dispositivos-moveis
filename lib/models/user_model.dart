class UserModel {
  String? id;
  String email;
  String password;
  String? name;

  UserModel({this.id, required this.email, required this.password, this.name});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'name': name,
    };
  }
}