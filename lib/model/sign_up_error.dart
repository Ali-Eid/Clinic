class SignUpErrorModel {
  bool? status;
  DataError? data;
  String? message;

  SignUpErrorModel({this.status, this.data, this.message});

  SignUpErrorModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new DataError.fromJson(json['data']) : null;
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

class DataError {
  List<dynamic>? firstName;
  List<dynamic>? lastName;
  List<dynamic>? address;
  List<dynamic>? addressCityId;
  List<dynamic>? addressDistrictId;
  List<dynamic>? specialtyId;
  List<dynamic>? email;
  List<dynamic>? password;

  DataError(
      {this.firstName,
      this.lastName,
      this.address,
      this.addressCityId,
      this.addressDistrictId,
      this.specialtyId,
      this.email,
      this.password});

  DataError.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    address = json['address'];
    addressCityId = json['address.city_id'];
    addressDistrictId = json['address.district_id'];
    specialtyId = json['specialty_id'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['address'] = this.address;
    data['address.city_id'] = this.addressCityId;
    data['address.district_id'] = this.addressDistrictId;
    data['specialty_id'] = this.specialtyId;
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}
