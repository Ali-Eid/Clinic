class CartAddModel {
  bool? status;
  Data? data;
  String? message;

  CartAddModel({this.status, this.data, this.message});

  CartAddModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }
}

class Data {
  List<dynamic>? attached;
  List<dynamic>? detached;
  List<dynamic>? updated;

  Data({this.attached, this.detached, this.updated});

  Data.fromJson(Map<String, dynamic> json) {
    attached = json['attached'];
    detached = json['detached'];
    updated = json['updated'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['attached'] = this.attached;
  //   if (this.detached != null) {
  //     data['detached'] = this.detached!.map((v) => v.toJson()).toList();
  //   }
  //   if (this.updated != null) {
  //     data['updated'] = this.updated!.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}
