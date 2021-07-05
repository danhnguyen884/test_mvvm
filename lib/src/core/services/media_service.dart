import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:test_mvvm/src/core/exeptions/app_exception.dart';
import 'package:test_mvvm/src/core/services/base_service.dart';
import 'package:http/http.dart' as http;

class MediaService extends BaseService{
  @override
  Future getResponse(String url) async{
    dynamic responseJson;
    try{
      final response = await http.get(Uri.parse(mediaBaseUrl+url));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Conection');
    }
    return responseJson;
  }
  @visibleForTesting
  dynamic returnResponse(http.Response response){
    switch(response.statusCode){
      case 200:
      dynamic responseJson = jsonDecode(response.body);
      return responseJson;
      case 400:
      throw BadRequestException(response.body.toString());
      case 401:
      case 403:
      throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
          'Error occured while communication with server ' +
          'with status code: ${response.statusCode}');
        
    }
  } 
}