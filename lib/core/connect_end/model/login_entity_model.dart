class LoginEntityModel {
  String? email;
  String? password;

  LoginEntityModel({this.email, this.password});

  factory LoginEntityModel.fromJson(Map<String, dynamic> json) {
    return LoginEntityModel(
      email: json['email']?.toString(),
      password: json['password']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
        if (email != null) 'email': email,
        if (password != null) 'password': password,
      };
}
