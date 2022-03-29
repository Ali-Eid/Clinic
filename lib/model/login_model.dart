class LoginModel {
  bool? status;
  Data? data;
  String? message;

  LoginModel({this.status, this.data, this.message});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  String? token;
  User? user;

  Data({this.token, this.user});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  int? addressId;
  int? specialtyId;
  String? firstName;
  String? lastName;
  String? email;
  String? mobileNumber;
  Null? photo;
  bool? isActive;
  Null? deletedAt;

  User(
      {this.id,
      this.addressId,
      this.specialtyId,
      this.firstName,
      this.lastName,
      this.email,
      this.mobileNumber,
      this.photo,
      this.isActive,
      this.deletedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    addressId = json['address_id'];
    specialtyId = json['specialty_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    mobileNumber = json['mobile_number'];
    photo = json['photo'];
    isActive = json['is_active'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['address_id'] = this.addressId;
    data['specialty_id'] = this.specialtyId;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['mobile_number'] = this.mobileNumber;
    data['photo'] = this.photo;
    data['is_active'] = this.isActive;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
