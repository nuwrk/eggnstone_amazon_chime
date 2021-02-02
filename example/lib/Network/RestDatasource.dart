import 'dart:convert';
import 'dart:io';

import 'package:chime_example/Pojo/MeetingData.dart';
import 'package:chime_example/Utils/NetworkUtil.dart';
import 'package:chime_example/Utils/Utils.dart';
import 'package:chime_example/data/EndMeeting.dart';
import 'package:connectivity/connectivity.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'ApiStateListener.dart';

class RestDataSource {
  NetworkUtil _netUtil = new NetworkUtil();
  ApiStateListener _apiStateListener;

  RestDataSource(this._apiStateListener);

  static final BASE_URL = "http://3.136.116.204:3000/";
  static final CREATE_MEETING = BASE_URL + "get_chime_token";
  static final END_CALL = BASE_URL + "end_meeting";
  static final JOIN_MEETING = BASE_URL + "join_meeting";


  createMeeting(String meetingTitle, String attendeName) {
    _checkInternetConnectivity().then((onValue) {
      if (onValue) {
        //check network before call api :)
        Map<String, String> requestHeaders = {
          'Accept': 'application/json',
        };

        _netUtil
            .post(CREATE_MEETING,
            body: {
              "title": meetingTitle,
              "name": attendeName
            },
            headers: requestHeaders)
            .then((dynamic res) {
          _apiStateListener.onSuccess(new MeetingData.fromJson(res));
        }).catchError((Object error) => {
          _apiStateListener.onError(error)
        });
      }
    });
  }

  endMeeting(String meetingId) {
    _checkInternetConnectivity().then((onValue) {
      if (onValue) {
        //check network before call api :)
        Map<String, String> requestHeaders = {
          'Accept': 'application/json',
        };

        _netUtil
            .post(END_CALL,
            body: {
              "meeting_id": meetingId,
            },
            headers: requestHeaders)
            .then((dynamic res) {
          _apiStateListener.onSuccess(new EndMeetingData.fromJson(res));
        }).catchError((Object error) => {
          _apiStateListener.onError(error)
        });
      }
    });
  }


  joinMeeting(String meetingName, String attendeName, String meetingId) {
    _checkInternetConnectivity().then((onValue) {
      if (onValue) {
        //check network before call api :)
        Map<String, String> requestHeaders = {
          'Accept': 'application/json',
        };

        _netUtil
            .post(JOIN_MEETING,
            body: {
              "title": meetingName,
              "name": attendeName,
              "meeting_id": meetingId
            },
            headers: requestHeaders)
            .then((dynamic res) {
          _apiStateListener.onSuccess(new MeetingData.fromJson(res));
        }).catchError((Object error) => {
          _apiStateListener.onError(error)
        });
      }
    });
  }


  Future<bool> _checkInternetConnectivity() async {
    var result = await Connectivity().checkConnectivity();

    if (result == ConnectivityResult.none) {
      Utils.showToast("Please check your internet connection!..");
      _apiStateListener.onNoNetWork(result);
      return false;
    } else if (result == ConnectivityResult.mobile) {
      return true;
    } else if (result == ConnectivityResult.wifi) {
      return true;
    }
  }

}
