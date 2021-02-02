//import 'dart:convert';
//import 'dart:developer';
//
//import 'package:http/http.dart';
//import 'package:poct/utils/RouteTransition/userall.model.dart';
//
//const STATUS_FAIL = 0;
//const STATUS_SUCCESS = true;
//const STATUS_NOT_VERIFIED_USER = 2;
//
//class LoginType {
//  static const String LOGIN_NORMAL = "1";
//  static const String LOGIN_FB = "2";
//  static const String LOGIN_GOOGLE = "3";
//}
//
//String tok = "";
//
//
//const BASE_URL = "http://18.222.136.124:9001/api/v1";
//
//const TYPE_FORM_DATA = {"Content-Type": "application/x-www-form-urlencoded"};
//const TYPE_JSON_DATA = {"Accept":"application/json"};
//var TYPE_JSON_DATA1 = {"Accept": "application/json", "Content-Type": "application/json"};
//var TYPE_FORM_DATA_AUTH = {"Content-Type": "application/x-www-form-urlencoded", "Authorization": '$tok'};
//var TYPE_JSON_DATA_AUTH = {"Accept": "application/json", "Content-Type": "application/json", "Authorization": '$tok'};
//var TYPE_JSON_DATA_AUTH1 = {"Content-Type": "application/json", "Authorization": '$tok'};
//
//
//
//class ApiProvider {
//  Client client = Client();
//  final _apiKey = 'api-key';
//
//  // LOCAL
//  // final _baseUrl = "http://192.168.0.6/BMS_Backend/api/v1";
//  final _baseUrl = "http://192.168.0.6/phew-backend/api/v1";
//
//  static var desfe = "dwdnj";
//
//  getToken() async {
//    tok = await LocalStorageService.getToken();
//    log(tok);
//  }
//
//  List<RequestAllUser> requestAllDataFromJson(String str) => fromJson(json.decode(str));
//
//  Future<List<RequestAllUser>> getAllUser(request) async {
//    //log("getAllUser  Future REQUEST..." + json.encode(request));
//    await getToken();
//    return await client
//        .post("$BASE_URL/users/all",body: json.encode(request), headers:TYPE_JSON_DATA_AUTH1)
//        .then((Response response) {
//      if (handleResponseAxios(response) != null) {
//
//        List res = json.decode(response.body);
//        log("users RESPONSE:" + res.length.toString());
//        // return res;
//        return requestAllDataFromJson(json.decode(response.body));
//      } else {
//        return null;
//      }
//    });
//  }
//
//}