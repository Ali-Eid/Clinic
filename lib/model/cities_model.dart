class CitiesModel {
  bool? status;
  List<DataCities>? data;
  String? message;

  CitiesModel({this.status, this.data, this.message});

  CitiesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <DataCities>[];
      json['data'].forEach((v) {
        data!.add(DataCities.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class DataCities {
  int? id;
  String? nameAr;
  String? nameEn;
  bool? isActive;
  var deletedAt;
  String? name;

  DataCities(
      {this.id,
      this.nameAr,
      this.nameEn,
      this.isActive,
      this.deletedAt,
      this.name});

  DataCities.fromJson(Map<String, dynamic> json) {
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
