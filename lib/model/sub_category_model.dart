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
        data!.add(DataSubCategory.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class DataSubCategory {
  int? id;
  int? categoryId;
  String? icon;
  bool? isActive;
  String? name;
  bool? hasChildren;
  Parent? parent;

  DataSubCategory(
      {this.id,
      this.categoryId,
      this.icon,
      this.isActive,
      this.name,
      this.hasChildren,
      this.parent});

  DataSubCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    icon = json['icon'];
    isActive = json['is_active'];
    name = json['name'];
    hasChildren = json['has_children'];
    parent = json['parent'] != null ? Parent.fromJson(json['parent']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category_id'] = categoryId;
    data['icon'] = icon;
    data['is_active'] = isActive;
    data['name'] = name;
    data['has_children'] = hasChildren;
    if (parent != null) {
      data['parent'] = parent!.toJson();
    }
    return data;
  }
}

class Parent {
  var categoryId;
  String? name;
  bool? hasChildren;
  var parent;

  Parent({this.categoryId, this.name, this.hasChildren, this.parent});

  Parent.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    name = json['name'];
    hasChildren = json['has_children'];
    parent = json['parent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category_id'] = categoryId;
    data['name'] = name;
    data['has_children'] = hasChildren;
    data['parent'] = parent;
    return data;
  }
}
