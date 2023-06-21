import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:mersal/utils/constants.dart';

class HttpHelper{
  static post ({required String url,Map? body})async{
    try{
      Uri link=Uri.parse("${Constant.baseUrl}$url");
      var result=await http.post(link,body:body, headers:{
        'Accept': 'application/json',
        'Accept-Language': 'ar'
        }
      );
      var response=jsonDecode(result.body);
      return response;
    }catch(e){
      if(kDebugMode){
        print("Error $e");
      }
      return e.toString();
    }

  }

  static get({required String url})async{
    try{
      Uri link=Uri.parse("${Constant.baseUrl}$url");
      if(kDebugMode){
        print("${Constant.baseUrl}$url");
      }
      var result=await http.get(link,headers:{
        'Accept': 'application/json',
        'Accept-Language': 'ar'
      });
      var response=jsonDecode(result.body);
      return response;
    }catch(e){
      if(kDebugMode){
        print("Error $e");
      }
      return e.toString();
    }

  }
}