import 'dart:io';
import 'package:fatimid/util/constants/api_endpoints.dart';
import 'package:fatimid/util/http/custom_response.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class Network extends GetConnect{

  final String _apiUrl = ApiEndPoints.quranCloudBaseUrl ;
  late String endpoint;
  Map<String,String>? _header ;
  Map<String,dynamic>? myQuery;
  var myBody;
  late Response _response;
  CustomResponse res = CustomResponse();

  Network(this.endpoint, {this.myBody, this.myQuery});

  _getToken() async {
    /*if(await AuthHelper().hasToken()){
      await AuthHelper().getToken().then((value) {
        _header = {'Authorization': 'Bearer $value'};
      });
    }else{
    }*/
  }

  Future<CustomResponse> eGet(String route,{Map? parameters}) async {
    await _getToken();
    try {
      _response = await get(_apiUrl + endpoint, headers: _header, query: myQuery);
      _hasAnyErrors();
    }
    on SocketException{
      res.hasError = true;
      res.statusCode = 0;
      res.message = 'error_SocketException'.tr;
    }
    on FormatException{
      res.hasError = true;
      res.statusCode = 0;
      res.message = 'error_FormatException'.tr;
    }
    catch (e) {
      _catchErrors(e);
    }

    return res;
  }

  Future<CustomResponse> ePost(String route, {Map? parameters}) async {
    await _getToken();
    try{
      _response = await post(_apiUrl + endpoint , myBody , headers: _header );
      _hasAnyErrors();
    }
    on SocketException{
      res.hasError = true;
      res.statusCode = 0;
      res.message = 'error_SocketException'.tr;
    }
    on FormatException{
      res.hasError = true;
      res.statusCode = 0;
      res.message = 'error_FormatException'.tr;
    }
    catch (e) {
      _catchErrors(e);
    }

    return res;
  }

  Future<CustomResponse> ePut(String route, {Map? parameters}) async {
    return res ;
  }

  Future<CustomResponse> eDelete(String route, {Map? parameters}) async {
    return res ;
  }


  _hasAnyErrors(){
    if(_response.statusCode == 200){
      res.data = _response.body ;
    }
    else{
      if(_response.statusCode == 400){
        res.hasError = true;
        res.statusCode = _response.statusCode!;
        res.message = _response.body['message'];
      }
      else if(_response.statusCode == 401){
        res.hasError = true;
        res.statusCode = 401;
        res.message = 'error_unauth'.tr;
      }
      else if(_response.statusCode == 500){
        res.hasError = true;
        res.statusCode = 500;
        res.message = 'error_server'.tr;
      }
      else if(_response.statusCode == 408){
        res.hasError = true;
        res.statusCode = 408;
        res.message = 'error_timeout'.tr;
      }
      else if(_response.status.connectionError){
        res.hasError = true;
        res.statusCode = 600;
        res.message = 'error_no_internet'.tr;
      }else if(_response.status.hasError){
        res.hasError = true;
        res.statusCode = 0;
        res.message = 'error_interior'.tr;
      }
    }
  }

  _catchErrors(e){
    if (kDebugMode) {
      print('Exception Error from catch : ');
      print(e);
      print('<=<=<=<=<=<=<=<=<=<=<=<=<=<=====>=>=>=>=>=>=>=>=>=>=>=>=>=>');
      print('              <=<=<=<=<=<=<=====>=>=>=>=>=>=>              ');
      print('                          <=====>                          ');
    }
  }
}
