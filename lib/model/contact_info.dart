class ContactInfoModel {
  bool? status;
  DataContact? data;
  String? message;

  ContactInfoModel({this.status, this.data, this.message});

  ContactInfoModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new DataContact.fromJson(json['data']) : null;
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

class DataContact {
  String? mobileNumber;
  String? facebook;
  String? instagram;

  DataContact({this.mobileNumber, this.facebook, this.instagram});

  DataContact.fromJson(Map<String, dynamic> json) {
    mobileNumber = json['mobile_number'];
    facebook = json['facebook'];
    instagram = json['instagram'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mobile_number'] = this.mobileNumber;
    data['facebook'] = this.facebook;
    data['instagram'] = this.instagram;
    return data;
  }
}
