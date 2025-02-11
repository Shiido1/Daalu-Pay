class ResetPasswordEntity {
  String? email;
  String? password;
  String? passwordConfirmation;
  String? token;

  ResetPasswordEntity({
    this.email,
    this.password,
    this.passwordConfirmation,
    this.token,
  });

  factory ResetPasswordEntity.fromJson(Map<String, dynamic> json) {
    return ResetPasswordEntity(
      email: json['email']?.toString(),
      password: json['password']?.toString(),
      passwordConfirmation: json['password_confirmation']?.toString(),
      token: json['token']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
        if (email != null) 'email': email,
        if (password != null) 'password': password,
        if (token != null) 'token': token,
        if (passwordConfirmation != null)
          'password_confirmation': passwordConfirmation,
      };
}
