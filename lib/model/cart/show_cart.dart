class ShowCartModel {
  bool? status;
  DataCart? data;
  String? message;

  ShowCartModel({this.status, this.data, this.message});

  ShowCartModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new DataCart.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class DataCart {
  List<Cart>? cart;
  String? totalPrice;

  DataCart({this.cart, this.totalPrice});

  DataCart.fromJson(Map<String, dynamic> json) {
    if (json['cart'] != null) {
      cart = <Cart>[];
      json['cart'].forEach((v) {
        cart!.add(new Cart.fromJson(v));
      });
    }
    totalPrice = json['total_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cart != null) {
      data['cart'] = this.cart!.map((v) => v.toJson()).toList();
    }
    data['total_price'] = this.totalPrice;
    return data;
  }
}

class Cart {
  int? id;
  int? categoryId;
  int? price;
  String? name;
  String? details;
  Pivot? pivot;
  List<Images>? images;
  Category? category;

  Cart(
      {this.id,
      this.categoryId,
      this.price,
      this.name,
      this.details,
      this.pivot,
      this.images,
      this.category});

  Cart.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    price = json['price'];
    name = json['name'];
    details = json['details'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
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
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    return data;
  }
}

class Pivot {
  int? userId;
  int? productId;
  int? quantity;

  Pivot({this.userId, this.productId, this.quantity});

  Pivot.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    productId = json['product_id'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['product_id'] = this.productId;
    data['quantity'] = this.quantity;
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
