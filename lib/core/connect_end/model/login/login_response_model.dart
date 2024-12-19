class LoginModel {
  String? status;
  Data? data;
  String? message;

  LoginModel({this.status, this.data, this.message});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class Data {
  String? uuid;
  String? firstName;
  String? lastName;
  String? gender;
  String? email;
  String? phone;
  String? status;
  String? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  List<dynamic>? wallets;
  List<dynamic>? transactions;

  Data(
      {this.uuid,
      this.firstName,
      this.lastName,
      this.gender,
      this.email,
      this.phone,
      this.status,
      this.emailVerifiedAt,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.wallets,
      this.transactions});

  Data.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    gender = json['gender'];
    email = json['email'];
    phone = json['phone'];
    status = json['status'];
    emailVerifiedAt = json['emailVerifiedAt'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
    if (json['wallets'] != null) {
      wallets = <dynamic>[];
      json['wallets'].forEach((v) {
        wallets!.add((v));
      });
    }
    if (json['transactions'] != null) {
      transactions = <dynamic>[];
      json['transactions'].forEach((v) {
        transactions!.add((v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uuid'] = uuid;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['gender'] = gender;
    data['email'] = email;
    data['phone'] = phone;
    data['status'] = status;
    data['emailVerifiedAt'] = emailVerifiedAt;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['deletedAt'] = deletedAt;
    if (wallets != null) {
      data['wallets'] = wallets!.map((v) => v.toJson()).toList();
    }
    if (transactions != null) {
      data['transactions'] = transactions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
