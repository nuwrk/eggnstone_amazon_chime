
import 'dart:convert';

MeetingData meetingDataFromJson(String str) => MeetingData.fromJson(json.decode(str));

String meetingDataToJson(MeetingData data) => json.encode(data.toJson());

class MeetingData {
  MeetingData({
    this.joinInfo,
  });

  JoinInfo joinInfo;

  factory MeetingData.fromJson(Map<String, dynamic> json) => MeetingData(
    joinInfo: JoinInfo.fromJson(json["joinInfo"]),
  );

  Map<String, dynamic> toJson() => {
    "joinInfo": joinInfo.toJson(),
  };
}

class JoinInfo {
  JoinInfo({
    this.meetingResponse,
    this.attendeeResponse,
  });

  MeetingResponse meetingResponse;
  AttendeeResponse attendeeResponse;

  factory JoinInfo.fromJson(Map<String, dynamic> json) => JoinInfo(
    meetingResponse: MeetingResponse.fromJson(json["meetingResponse"]),
    attendeeResponse: AttendeeResponse.fromJson(json["attendeeResponse"]),
  );

  Map<String, dynamic> toJson() => {
    "meetingResponse": meetingResponse.toJson(),
    "attendeeResponse": attendeeResponse.toJson(),
  };
}

class AttendeeResponse {
  AttendeeResponse({
    this.attendee,
  });

  AttendeeData attendee;

  factory AttendeeResponse.fromJson(Map<String, dynamic> json) => AttendeeResponse(
    attendee: AttendeeData.fromJson(json["Attendee"]),
  );

  Map<String, dynamic> toJson() => {
    "Attendee": attendee.toJson(),
  };
}

class AttendeeData {
  AttendeeData({
    this.externalUserId,
    this.attendeeId,
    this.joinToken,
  });

  String externalUserId;
  String attendeeId;
  String joinToken;

  factory AttendeeData.fromJson(Map<String, dynamic> json) => AttendeeData(
    externalUserId: json["ExternalUserId"],
    attendeeId: json["AttendeeId"],
    joinToken: json["JoinToken"],
  );

  Map<String, dynamic> toJson() => {
    "ExternalUserId": externalUserId,
    "AttendeeId": attendeeId,
    "JoinToken": joinToken,
  };
}

class MeetingResponse {
  MeetingResponse({
    this.meeting,
  });

  Meeting meeting;

  factory MeetingResponse.fromJson(Map<String, dynamic> json) => MeetingResponse(
    meeting: Meeting.fromJson(json["Meeting"]),
  );

  Map<String, dynamic> toJson() => {
    "Meeting": meeting.toJson(),
  };
}

class Meeting {
  Meeting({
    this.meetingId,
    this.externalMeetingId,
    this.mediaPlacement,
    this.mediaRegion,
  });

  String meetingId;
  String externalMeetingId;
  MediaPlacement mediaPlacement;
  String mediaRegion;

  factory Meeting.fromJson(Map<String, dynamic> json) => Meeting(
    meetingId: json["MeetingId"],
    externalMeetingId: json["ExternalMeetingId"],
    mediaPlacement: MediaPlacement.fromJson(json["MediaPlacement"]),
    mediaRegion: json["MediaRegion"],
  );

  Map<String, dynamic> toJson() => {
    "MeetingId": meetingId,
    "ExternalMeetingId": externalMeetingId,
    "MediaPlacement": mediaPlacement.toJson(),
    "MediaRegion": mediaRegion,
  };
}

class MediaPlacement {
  MediaPlacement({
    this.audioHostUrl,
    this.audioFallbackUrl,
    this.screenDataUrl,
    this.screenSharingUrl,
    this.screenViewingUrl,
    this.signalingUrl,
    this.turnControlUrl,
  });

  String audioHostUrl;
  String audioFallbackUrl;
  String screenDataUrl;
  String screenSharingUrl;
  String screenViewingUrl;
  String signalingUrl;
  String turnControlUrl;

  factory MediaPlacement.fromJson(Map<String, dynamic> json) => MediaPlacement(
    audioHostUrl: json["AudioHostUrl"],
    audioFallbackUrl: json["AudioFallbackUrl"],
    screenDataUrl: json["ScreenDataUrl"],
    screenSharingUrl: json["ScreenSharingUrl"],
    screenViewingUrl: json["ScreenViewingUrl"],
    signalingUrl: json["SignalingUrl"],
    turnControlUrl: json["TurnControlUrl"],
  );

  Map<String, dynamic> toJson() => {
    "AudioHostUrl": audioHostUrl,
    "AudioFallbackUrl": audioFallbackUrl,
    "ScreenDataUrl": screenDataUrl,
    "ScreenSharingUrl": screenSharingUrl,
    "ScreenViewingUrl": screenViewingUrl,
    "SignalingUrl": signalingUrl,
    "TurnControlUrl": turnControlUrl,
  };
}
