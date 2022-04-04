class UserModel {
  bool? status;
  Data? data;
  String? message;

  UserModel({this.status, this.data, this.message});

  UserModel.fromJson(Map<String, dynamic> json) {
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
  Address? address;
  City? specialty;

  Data(
      {this.id,
      this.addressId,
      this.specialtyId,
      this.firstName,
      this.lastName,
      this.email,
      this.mobileNumber,
      this.photo,
      this.isActive,
      this.deletedAt,
      this.address,
      this.specialty});

  Data.fromJson(Map<String, dynamic> json) {
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
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
    specialty =
        json['specialty'] != null ? new City.fromJson(json['specialty']) : null;
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
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    if (this.specialty != null) {
      data['specialty'] = this.specialty!.toJson();
    }
    return data;
  }
}

class Address {
  int? id;
  int? districtId;
  int? cityId;
  var details;
  City? city;
  District? district;

  Address(
      {this.id,
      this.districtId,
      this.cityId,
      this.details,
      this.city,
      this.district});

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    districtId = json['district_id'];
    cityId = json['city_id'];
    details = json['details'];
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
    district = json['district'] != null
        ? new District.fromJson(json['district'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['district_id'] = this.districtId;
    data['city_id'] = this.cityId;
    data['details'] = this.details;
    if (this.city != null) {
      data['city'] = this.city!.toJson();
    }
    if (this.district != null) {
      data['district'] = this.district!.toJson();
    }
    return data;
  }
}

class City {
  int? id;
  String? nameAr;
  String? nameEn;
  bool? isActive;
  Null? deletedAt;
  String? name;

  City(
      {this.id,
      this.nameAr,
      this.nameEn,
      this.isActive,
      this.deletedAt,
      this.name});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    isActive = json['is_active'];
    deletedAt = json['deleted_at'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_ar'] = this.nameAr;
    data['name_en'] = this.nameEn;
    data['is_active'] = this.isActive;
    data['deleted_at'] = this.deletedAt;
    data['name'] = this.name;
    return data;
  }
}

class District {
  int? id;
  int? cityId;
  String? nameAr;
  String? nameEn;
  bool? isActive;
  Null? deletedAt;
  String? name;

  District(
      {this.id,
      this.cityId,
      this.nameAr,
      this.nameEn,
      this.isActive,
      this.deletedAt,
      this.name});

  District.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cityId = json['city_id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    isActive = json['is_active'];
    deletedAt = json['deleted_at'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['city_id'] = this.cityId;
    data['name_ar'] = this.nameAr;
    data['name_en'] = this.nameEn;
    data['is_active'] = this.isActive;
    data['deleted_at'] = this.deletedAt;
    data['name'] = this.name;
    return data;
  }
}
