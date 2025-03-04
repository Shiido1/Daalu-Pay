class UpdateUserEntityModel {
  String? firstName;
  String? lastName;
  String? gender;
  String? dateOfBirth;
  String? email;
  String? phone;
  String? password;
  String? photo;

  UpdateUserEntityModel({
    this.firstName,
    this.lastName,
    this.gender,
    this.dateOfBirth,
    this.email,
    this.phone,
    this.password,
    this.photo,
  });

  factory UpdateUserEntityModel.fromJson(Map<String, dynamic> json) {
    return UpdateUserEntityModel(
      firstName: json['first_name']?.toString(),
      lastName: json['last_name']?.toString(),
      gender: json['gender']?.toString(),
      dateOfBirth: json['date_of_birth']?.toString(),
      email: json['email']?.toString(),
      phone: json['phone']?.toString(),
      password: json['password']?.toString(),
      photo: json['photo']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
        if (firstName != null) 'first_name': firstName,
        if (lastName != null) 'last_name': lastName,
        if (gender != null) 'gender': gender,
        if (dateOfBirth != null) 'date_of_birth': dateOfBirth,
        if (email != null) 'email': email,
        if (phone != null) 'phone': phone,
        if (password != null) 'password': password,
        if (photo != null) 'photo': photo,
      };
}
