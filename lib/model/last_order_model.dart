class LastOrderModel {
  bool? status;
  List<DataLastOrder>? data;
  String? message;

  LastOrderModel({this.status, this.data, this.message});

  LastOrderModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <DataLastOrder>[];
      json['data'].forEach((v) {
        data!.add(DataLastOrder.fromJson(v));
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

class DataLastOrder {
  int? id;
  int? userId;
  int? addressId;
  String? type;
  String? status;
  int? price;
  String? mobileNumber;
  String? createdAt;
  String? updatedAt;
  var deletedAt;
  String? translatedStatus;
  String? translatedtype;
  Details? details;
  Address? address;

  DataLastOrder(
      {this.id,
      this.userId,
      this.addressId,
      this.type,
      this.status,
      this.price,
      this.mobileNumber,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.translatedStatus,
      this.translatedtype,
      this.details,
      this.address});

  DataLastOrder.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    addressId = json['address_id'];
    type = json['type'];
    status = json['status'];
    price = json['price'];
    mobileNumber = json['mobile_number'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    translatedStatus = json['translated_status'];
    translatedtype = json['translated_type'];
    details =
        json['details'] != null ? Details.fromJson(json['details']) : null;
    address =
        json['address'] != null ? Address.fromJson(json['address']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['address_id'] = addressId;
    data['type'] = type;
    data['status'] = status;
    data['price'] = price;
    data['mobile_number'] = mobileNumber;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    data['translated_status'] = translatedStatus;
    if (details != null) {
      data['details'] = details!.toJson();
    }
    if (address != null) {
      data['address'] = address!.toJson();
    }
    return data;
  }
}

class Details {
  int? id;
  String? serialNumber;
  String? style;
  String? type;
  String? description;
  var deletedAt;
  List<Products>? products;
  String? createdAt;
  String? updatedAt;

  Details(
      {this.id,
      this.serialNumber,
      this.style,
      this.type,
      this.description,
      this.deletedAt,
      this.products,
      this.createdAt,
      this.updatedAt});

  Details.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    serialNumber = json['serial_number'];
    style = json['style'];
    type = json['type'];
    description = json['description'];
    deletedAt = json['deleted_at'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['serial_number'] = serialNumber;
    data['style'] = style;
    data['type'] = type;
    data['description'] = description;
    data['deleted_at'] = deletedAt;
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Products {
  int? id;
  int? quantity;
  int? price;
  Product? product;

  Products({this.id, this.quantity, this.price, this.product});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    price = json['price'];
    product =
        json['product'] != null ? Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['quantity'] = quantity;
    data['price'] = price;
    if (product != null) {
      data['product'] = product!.toJson();
    }
    return data;
  }
}

class Product {
  int? id;
  int? categoryId;
  int? price;
  String? name;
  String? details;
  List<Images>? images;
  Category? category;

  Product(
      {this.id,
      this.categoryId,
      this.price,
      this.name,
      this.details,
      this.images,
      this.category});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    price = json['price'];
    name = json['name'];
    details = json['details'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
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
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    if (category != null) {
      data['category'] = category!.toJson();
    }
    return data;
  }
}

class Images {
  int? id;
  int? productId;
  String? path;

  Images({this.id, this.productId, this.path});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    path = json['path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_id'] = productId;
    data['path'] = path;
    return data;
  }
}

class Category {
  int? id;
  int? categoryId;
  String? icon;
  bool? isActive;
  String? name;
  bool? hasChildren;
  Parent? parent;

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

class Address {
  int? id;
  int? districtId;
  int? cityId;
  String? details;
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
