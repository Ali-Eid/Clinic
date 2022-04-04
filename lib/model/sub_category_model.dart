class SubCategoryModel {
  bool? status;
  List<DataSubCategory>? data;
  String? message;

  SubCategoryModel({this.status, this.data, this.message});

  SubCategoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <DataSubCategory>[];
      json['data'].forEach((v) {
        data!.add(new DataSubCategory.fromJson(v));
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

class DataSubCategory {
  int? id;
  int? categoryId;
  String? icon;
  bool? isActive;
  String? name;

  DataSubCategory(
      {this.id, this.categoryId, this.icon, this.isActive, this.name});

  DataSubCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    icon = json['icon'];
    isActive = json['is_active'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    data['icon'] = this.icon;
    data['is_active'] = this.isActive;
    data['name'] = this.name;
    return data;
  }
}
