class ServiceListModel {
  bool? status;
  List<DataServiceList>? data;
  String? message;

  ServiceListModel({this.status, this.data, this.message});

  ServiceListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <DataServiceList>[];
      json['data'].forEach((v) {
        data!.add(new DataServiceList.fromJson(v));
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

class DataServiceList {
  int? id;
  bool? isMain;
  String? icon;
  String? type;
  String? name;
  String? description;

  DataServiceList(
      {this.id,
      this.isMain,
      this.icon,
      this.type,
      this.name,
      this.description});

  DataServiceList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isMain = json['is_main'];
    icon = json['icon'];
    type = json['type'];
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['is_main'] = this.isMain;
    data['icon'] = this.icon;
    data['type'] = this.type;
    data['name'] = this.name;
    data['description'] = this.description;
    return data;
  }
}
