class AuthModel {
  bool? status;
  Data? data;
  String? message;

  AuthModel({this.status, this.data, this.message});

  AuthModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class Data {
  UserData? user;
  String? token;

  Data({this.user, this.token});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? UserData.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['token'] = token;
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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['specialty_id'] = specialtyId;
    data['email'] = email;
    data['address_id'] = addressId;
    data['id'] = id;
    return data;
  }
}
