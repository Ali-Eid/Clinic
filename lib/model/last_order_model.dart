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
        data!.add(new DataLastOrder.fromJson(v));
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
  Null? deletedAt;
  String? translatedStatus;
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
    details =
        json['details'] != null ? new Details.fromJson(json['details']) : null;
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['address_id'] = this.addressId;
    data['type'] = this.type;
    data['status'] = this.status;
    data['price'] = this.price;
    data['mobile_number'] = this.mobileNumber;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['translated_status'] = this.translatedStatus;
    if (this.details != null) {
      data['details'] = this.details!.toJson();
    }
    if (this.address != null) {
      data['address'] = this.address!.toJson();
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
  Null? deletedAt;
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
        products!.add(new Products.fromJson(v));
      });
    }
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['serial_number'] = this.serialNumber;
    data['style'] = this.style;
    data['type'] = this.type;
    data['description'] = this.description;
    data['deleted_at'] = this.deletedAt;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
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
        json['product'] != null ? new Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
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
        images!.add(new Images.fromJson(v));
      });
    }
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
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    if (this.category != null) {
      data['category'] = this.category!.toJson();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['path'] = this.path;
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
    parent =
        json['parent'] != null ? new Parent.fromJson(json['parent']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    data['icon'] = this.icon;
    data['is_active'] = this.isActive;
    data['name'] = this.name;
    data['has_children'] = this.hasChildren;
    if (this.parent != null) {
      data['parent'] = this.parent!.toJson();
    }
    return data;
  }
}

class Parent {
  Null? categoryId;
  String? name;
  bool? hasChildren;
  Null? parent;

  Parent({this.categoryId, this.name, this.hasChildren, this.parent});

  Parent.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    name = json['name'];
    hasChildren = json['has_children'];
    parent = json['parent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['name'] = this.name;
    data['has_children'] = this.hasChildren;
    data['parent'] = this.parent;
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
