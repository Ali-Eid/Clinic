class AuthModel {
  bool? status;
  Data? data;
  String? message;

  AuthModel({this.status, this.data, this.message});

  AuthModel.fromJson(Map<String, dynamic> json) {
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
  UserData? user;
  String? token;

  Data({this.user, this.token});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new UserData.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class UserData {
  dynamic? firstName;
  dynamic? lastName;
  int? specialtyId;
  dynamic? email;
  int? addressId;
  int? id;

  UserData(
      {this.firstName,
      this.lastName,
      this.specialtyId,
      this.email,
      this.addressId,
      this.id});

  UserData.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    specialtyId = json['specialty_id'];
    email = json['email'];
    addressId = json['address_id'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['specialty_id'] = this.specialtyId;
    data['email'] = this.email;
    data['address_id'] = this.addressId;
    data['id'] = this.id;
    return data;
  }
}
