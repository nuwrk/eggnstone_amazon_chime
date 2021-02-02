import 'dart:convert';

EndMeetingData endDataFromJson(String str) => EndMeetingData.fromJson(json.decode(str));

String endDataToJson(EndMeetingData data) => json.encode(data.toJson());

class EndMeetingData {
  EndMeetingData({
    this.success,
    this.message,
  });

  String success;
  String message;

  factory EndMeetingData.fromJson(Map<String, dynamic> json) => EndMeetingData(
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
  };
}
