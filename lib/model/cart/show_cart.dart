class ShowCartModel {
  bool? status;
  Data? data;
  String? message;

  ShowCartModel({this.status, this.data, this.message});

  ShowCartModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class Data {
  List<Cart>? cart;
  dynamic totalPrice;

  Data({this.cart, this.totalPrice});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['cart'] != null) {
      cart = <Cart>[];
      json['cart'].forEach((v) {
        cart!.add(Cart.fromJson(v));
      });
    }
    totalPrice = json['total_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (cart != null) {
      data['cart'] = cart!.map((v) => v.toJson()).toList();
    }
    data['total_price'] = totalPrice;
    return data;
  }
}

class Cart {
  int? id;
  int? categoryId;
  int? price;
  String? name;
  String? details;
  CartProduct? cartProduct;
  List<Images>? images;
  Category? category;

  Cart(
      {this.id,
      this.categoryId,
      this.price,
      this.name,
      this.details,
      this.cartProduct,
      this.images,
      this.category});

  Cart.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    price = json['price'];
    name = json['name'];
    details = json['details'];
    cartProduct = json['cart_product'] != null
        ? CartProduct.fromJson(json['cart_product'])
        : null;
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
    if (cartProduct != null) {
      data['cart_product'] = cartProduct!.toJson();
    }
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    if (category != null) {
      data['category'] = category!.toJson();
    }
    return data;
  }
}

class CartProduct {
  int? userId;
  int? productId;
  int? quantity;
  int? id;

  CartProduct({this.userId, this.productId, this.quantity, this.id});

  CartProduct.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    productId = json['product_id'];
    quantity = json['quantity'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['product_id'] = productId;
    data['quantity'] = quantity;
    data['id'] = id;
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
