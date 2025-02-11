class ResetPasswordEntity {
  String? email;
  String? password;
  String? passwordConfirmation;
  String? token;
  String? usedId;

  ResetPasswordEntity(
      {this.email,
      this.password,
      this.passwordConfirmation,
      this.token,
      this.usedId});

  factory ResetPasswordEntity.fromJson(Map<String, dynamic> json) {
    return ResetPasswordEntity(
      email: json['email']?.toString(),
      password: json['password']?.toString(),
      passwordConfirmation: json['password_confirmation']?.toString(),
      token: json['token']?.toString(),
      usedId: json['user_id']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
        if (email != null) 'email': email,
        if (password != null) 'password': password,
        if (token != null) 'token': token,
        if (usedId != null) 'user_id': usedId,
        if (passwordConfirmation != null)
          'password_confirmation': passwordConfirmation,
      };
}
