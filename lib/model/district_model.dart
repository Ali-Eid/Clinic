class DisrtictModel {
  bool? status;
  List<DataDistrict>? data;
  String? message;

  DisrtictModel({this.status, this.data, this.message});

  DisrtictModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <DataDistrict>[];
      json['data'].forEach((v) {
        data!.add(new DataDistrict.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class DataDistrict {
  int? id;
  int? cityId;
  String? nameAr;
  String? nameEn;
  bool? isActive;
  Null? deletedAt;
  String? name;

  DataDistrict(
      {this.id,
      this.cityId,
      this.nameAr,
      this.nameEn,
      this.isActive,
      this.deletedAt,
      this.name});

  DataDistrict.fromJson(Map<String, dynamic> json) {
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
