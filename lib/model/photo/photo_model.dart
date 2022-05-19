class PhotoModel {
  bool? status;
  String? data;
  String? message;

  PhotoModel({this.status, this.data, this.message});

  PhotoModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    data['data'] = this.data;
    data['message'] = message;
    return data;
  }
}
