class OrderModel {
  bool? status;
  Data? data;
  String? message;

  OrderModel({this.status, this.data, this.message});

  OrderModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
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

class Data {
  var mobileNumber;
  String? type;
  int? price;
  String? status;
  int? addressId;
  int? userId;
  String? updatedAt;
  String? createdAt;
  int? id;

  Data(
      {this.mobileNumber,
      this.type,
      this.price,
      this.status,
      this.addressId,
      this.userId,
      this.updatedAt,
      this.createdAt,
      this.id});

  Data.fromJson(Map<String, dynamic> json) {
    mobileNumber = json['mobile_number'];
    type = json['type'];
    price = json['price'];
    status = json['status'];
    addressId = json['address_id'];
    userId = json['user_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mobile_number'] = this.mobileNumber;
    data['type'] = this.type;
    data['price'] = this.price;
    data['status'] = this.status;
    data['address_id'] = this.addressId;
    data['user_id'] = this.userId;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
