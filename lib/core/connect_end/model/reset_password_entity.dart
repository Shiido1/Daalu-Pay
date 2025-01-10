class ResetPasswordEntity {
  String? email;
  String? password;
  String? passwordConfirmation;

  ResetPasswordEntity({
    this.email,
    this.password,
    this.passwordConfirmation,
  });

  factory ResetPasswordEntity.fromJson(Map<String, dynamic> json) {
    return ResetPasswordEntity(
      email: json['email']?.toString(),
      password: json['password']?.toString(),
      passwordConfirmation: json['password_confirmation']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
        if (email != null) 'email': email,
        if (password != null) 'password': password,
        if (passwordConfirmation != null)
          'password_confirmation': passwordConfirmation,
      };
}
