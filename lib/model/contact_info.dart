class ContactInfoModel {
  bool? status;
  DataContact? data;
  String? message;

  ContactInfoModel({this.status, this.data, this.message});

  ContactInfoModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? DataContact.fromJson(json['data']) : null;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['mobile_number'] = mobileNumber;
    data['facebook'] = facebook;
    data['instagram'] = instagram;
    return data;
  }
}
