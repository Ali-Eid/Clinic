class ProductsCategory {
  bool? status;
  List<DataProductCateg>? data;
  String? message;

  ProductsCategory({this.status, this.data, this.message});

  ProductsCategory.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <DataProductCateg>[];
      json['data'].forEach((v) {
        data!.add(DataProductCateg.fromJson(v));
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

class DataProductCateg {
  int? id;
  int? categoryId;
  int? price;
  String? name;
  String? details;
  List<dynamic>? images;
  Category? category;

  DataProductCateg(
      {this.id,
      this.categoryId,
      this.price,
      this.name,
      this.details,
      this.images,
      this.category});

  DataProductCateg.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    price = json['price'];
    name = json['name'];
    details = json['details'];
    // if (json['images'] != null) {
    //   images = <Null>[];
    //   json['images'].forEach((v) {
    //     images!.add(new Null.fromJson(v));
    //   });
    // }
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category_id'] = categoryId;
    data['price'] = price;
    data['name'] = name;
    data['details'] = details;
    // if (this.images != null) {
    //   data['images'] = this.images!.map((v) => v.toJson()).toList();
    // }
    if (category != null) {
      data['category'] = category!.toJson();
    }
    return data;
  }
}

class Category {
  int? id;
  var categoryId;
  String? icon;
  bool? isActive;
  String? name;
  bool? hasChildren;
  var parent;

  Category(
      {this.id,
      this.categoryId,
      this.icon,
      this.isActive,
      this.name,
      this.hasChildren,
      this.parent});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    icon = json['icon'];
    isActive = json['is_active'];
    name = json['name'];
    hasChildren = json['has_children'];
    parent = json['parent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category_id'] = categoryId;
    data['icon'] = icon;
    data['is_active'] = isActive;
    data['name'] = name;
    data['has_children'] = hasChildren;
    data['parent'] = parent;
    return data;
  }
}
