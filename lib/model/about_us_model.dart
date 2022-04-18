class AboutUsModel {
  bool? status;
  Data? data;
  String? message;

  AboutUsModel({this.status, this.data, this.message});

  AboutUsModel.fromJson(Map<String, dynamic> json) {
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
  String? body;

  Data({this.body});

  Data.fromJson(Map<String, dynamic> json) {
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['body'] = body;
    return data;
  }
}
