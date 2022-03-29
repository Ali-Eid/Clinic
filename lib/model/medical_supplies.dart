class MedicalSupplies {
  bool? status;
  List<MedicalSuppliesData>? data;
  String? message;

  MedicalSupplies({this.status, this.data, this.message});

  MedicalSupplies.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <MedicalSuppliesData>[];
      json['data'].forEach((v) {
        data!.add(new MedicalSuppliesData.fromJson(v));
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

class MedicalSuppliesData {
  int? id;
  Null? categoryId;
  String? nameAr;
  String? nameEn;
  String? icon;
  bool? isActive;
  Null? deletedAt;
  String? name;
  bool? hasChildren;

  MedicalSuppliesData(
      {this.id,
      this.categoryId,
      this.nameAr,
      this.nameEn,
      this.icon,
      this.isActive,
      this.deletedAt,
      this.name,
      this.hasChildren});

  MedicalSuppliesData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    icon = json['icon'];
    isActive = json['is_active'];
    deletedAt = json['deleted_at'];
    name = json['name'];
    hasChildren = json['has_children'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    data['name_ar'] = this.nameAr;
    data['name_en'] = this.nameEn;
    data['icon'] = this.icon;
    data['is_active'] = this.isActive;
    data['deleted_at'] = this.deletedAt;
    data['name'] = this.name;
    data['has_children'] = this.hasChildren;
    return data;
  }
}
