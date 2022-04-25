class NotificationsModel {
  bool? status;
  Data? data;
  String? message;

  NotificationsModel({this.status, this.data, this.message});

  NotificationsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['status'] = status;
  //   if (this.data != null) {
  //     data['data'] = this.data!.toJson();
  //   }
  //   data['message'] = message;
  //   return data;
  // }
}

class Data {
  int? currentPage;
  List<DNotification>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  var nextPageUrl;
  String? path;
  int? perPage;
  var prevPageUrl;
  int? to;
  int? total;

  Data(
      {this.currentPage,
      this.data,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      this.links,
      this.nextPageUrl,
      this.path,
      this.perPage,
      this.prevPageUrl,
      this.to,
      this.total});

  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <DNotification>[];
      json['data'].forEach((v) {
        data!.add(DNotification.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['current_page'] = currentPage;
  //   if (this.data != null) {
  //     data['data'] = this.data!.map((v) => v.toJson()).toList();
  //   }
  //   data['first_page_url'] = firstPageUrl;
  //   data['from'] = from;
  //   data['last_page'] = lastPage;
  //   data['last_page_url'] = lastPageUrl;
  //   if (links != null) {
  //     data['links'] = links!.map((v) => v.toJson()).toList();
  //   }
  //   data['next_page_url'] = nextPageUrl;
  //   data['path'] = path;
  //   data['per_page'] = perPage;
  //   data['prev_page_url'] = prevPageUrl;
  //   data['to'] = to;
  //   data['total'] = total;
  //   return data;
  // }
}

class DNotification {
  String? id;
  String? type;
  String? notifiableType;
  int? notifiableId;
  DataNotifications? data;
  var readAt;
  String? createdAt;
  String? updatedAt;

  DNotification(
      {this.id,
      this.type,
      this.notifiableType,
      this.notifiableId,
      this.data,
      this.readAt,
      this.createdAt,
      this.updatedAt});

  DNotification.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    notifiableType = json['notifiable_type'];
    notifiableId = json['notifiable_id'];
    data =
        json['data'] != null ? DataNotifications.fromJson(json['data']) : null;
    readAt = json['read_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}

class DataNotifications {
  String? title;
  String? body;
  String? redirectUrl;
  String? image;

  DataNotifications({this.title, this.body, this.redirectUrl, this.image});

  DataNotifications.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    body = json['body'];
    redirectUrl = json['redirect_url'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['body'] = body;
    data['redirect_url'] = redirectUrl;
    data['image'] = image;
    return data;
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['label'] = label;
    data['active'] = active;
    return data;
  }
}
