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
        data!.add(new DataProductCateg.fromJson(v));
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

class DataProductCateg {
  int? id;
  int? categoryId;
  int? price;
  String? name;
  String? details;
  List<Null>? images;
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
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    data['price'] = this.price;
    data['name'] = this.name;
    data['details'] = this.details;
    // if (this.images != null) {
    //   data['images'] = this.images!.map((v) => v.toJson()).toList();
    // }
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    return data;
  }
}

class Category {
  int? id;
  Null? categoryId;
  String? icon;
  bool? isActive;
  String? name;
  bool? hasChildren;
  Null? parent;

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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    data['icon'] = this.icon;
    data['is_active'] = this.isActive;
    data['name'] = this.name;
    data['has_children'] = this.hasChildren;
    data['parent'] = this.parent;
    return data;
  }
}
