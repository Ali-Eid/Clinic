class ServiceModel {
  bool? status;
  Data? data;
  String? message;

  ServiceModel({this.status, this.data, this.message});

  ServiceModel.fromJson(Map<String, dynamic> json) {
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
  int? id;
  String? slug;
  bool? isMain;
  String? icon;
  String? type;
  String? orderType;
  String? name;
  var description;
  List<Images>? images;

  Data(
      {this.id,
      this.slug,
      this.isMain,
      this.icon,
      this.type,
      this.orderType,
      this.name,
      this.description,
      this.images});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    isMain = json['is_main'];
    icon = json['icon'];
    type = json['type'];
    orderType = json['order_type'];
    name = json['name'];
    description = json['description'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['slug'] = slug;
    data['is_main'] = isMain;
    data['icon'] = icon;
    data['type'] = type;
    data['order_type'] = orderType;
    data['name'] = name;
    data['description'] = description;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Images {
  int? id;
  int? serviceId;
  String? path;
  String? createdAt;
  String? updatedAt;

  Images({this.id, this.serviceId, this.path, this.createdAt, this.updatedAt});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    serviceId = json['service_id'];
    path = json['path'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['service_id'] = serviceId;
    data['path'] = path;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
