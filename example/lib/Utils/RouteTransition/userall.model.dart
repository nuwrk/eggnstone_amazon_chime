import 'dart:convert';


List<RequestAllUser> requestAllDataFromJson(String str) => fromJson(json.decode(str));


List<RequestAllUser> fromJson(String str) =>
    List<RequestAllUser>.from(
        json.decode(str).map((x) => RequestAllUser.fromJson(x)));

class RequestAllUser {
  RequestAllUser({
    this.id,
    this.contactId,
    this.username,
    this.linked,
    this.activate,
    this.exist,
    this.phone,
    this.image,
    this.status,
  });

  String id;
  String contactId;
  String username;
  bool linked;
  bool activate;
  bool exist;
  String phone;
  String image;
  dynamic status;

  factory RequestAllUser.fromJson(Map<String, dynamic> json) => RequestAllUser(
    id: json["_id"],
    contactId: json["contactId"],
    username: json["username"],
    linked: json["linked"],
    activate: json["activate"],
    exist: json["exist"],
    phone: json["phone"],
    image: json["image"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "contactId": contactId,
    "username": username,
    "linked": linked,
    "activate": activate,
    "exist": exist,
    "phone": phone,
    "image": image,
    "status": status,
  };
}
