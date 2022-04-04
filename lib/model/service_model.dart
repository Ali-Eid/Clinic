class ServiceModel {
  bool? status;
  DataService? data;
  String? message;

  ServiceModel({this.status, this.data, this.message});

  ServiceModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new DataService.fromJson(json['data']) : null;
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

class DataService {
  int? id;
  bool? isMain;
  String? icon;
  String? type;
  String? name;
  String? description;
  List<dynamic>? images;

  DataService(
      {this.id,
      this.isMain,
      this.icon,
      this.type,
      this.name,
      this.description,
      this.images});

  DataService.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isMain = json['is_main'];
    icon = json['icon'];
    type = json['type'];
    name = json['name'];
    description = json['description'];
    // if (json['images'] != null) {
    //   images = <dynamic>[];
    //   json['images'].forEach((v) {
    //     images!.add(new Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['is_main'] = this.isMain;
    data['icon'] = this.icon;
    data['type'] = this.type;
    data['name'] = this.name;
    data['description'] = this.description;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
