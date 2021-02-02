import 'package:connectivity/connectivity.dart';


//api listener with network option :) cool.
abstract class ApiStateListener{
  void onSuccess(dynamic data);
  void onError(dynamic data);
  void onNoNetWork(ConnectivityResult result);
}