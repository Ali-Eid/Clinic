class UserModel {
  bool? status;
  Data? data;
  String? message;

  UserModel({this.status, this.data, this.message});

  UserModel.fromJson(Map<String, dynamic> json) {
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
  int? id;
  int? addressId;
  int? specialtyId;
  String? firstName;
  String? lastName;
  String? email;
  String? mobileNumber;
  String? photo;
  bool? isActive;
  var deletedAt;
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
        json['address'] != null ? Address.fromJson(json['address']) : null;
    specialty =
        json['specialty'] != null ? City.fromJson(json['specialty']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['address_id'] = addressId;
    data['specialty_id'] = specialtyId;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['mobile_number'] = mobileNumber;
    data['photo'] = photo;
    data['is_active'] = isActive;
    data['deleted_at'] = deletedAt;
    if (address != null) {
      data['address'] = address!.toJson();
    }
    if (specialty != null) {
      data['specialty'] = specialty!.toJson();
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
    city = json['city'] != null ? City.fromJson(json['city']) : null;
    district =
        json['district'] != null ? District.fromJson(json['district']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['district_id'] = districtId;
    data['city_id'] = cityId;
    data['details'] = details;
    if (city != null) {
      data['city'] = city!.toJson();
    }
    if (district != null) {
      data['district'] = district!.toJson();
    }
    return data;
  }
}

class City {
  int? id;
  String? nameAr;
  String? nameEn;
  bool? isActive;
  var deletedAt;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name_ar'] = nameAr;
    data['name_en'] = nameEn;
    data['is_active'] = isActive;
    data['deleted_at'] = deletedAt;
    data['name'] = name;
    return data;
  }
}

class District {
  int? id;
  int? cityId;
  String? nameAr;
  String? nameEn;
  bool? isActive;
  var deletedAt;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['city_id'] = cityId;
    data['name_ar'] = nameAr;
    data['name_en'] = nameEn;
    data['is_active'] = isActive;
    data['deleted_at'] = deletedAt;
    data['name'] = name;
    return data;
  }
}
