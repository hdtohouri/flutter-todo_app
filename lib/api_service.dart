import 'dart:convert';

import 'package:http/http.dart' as http;
import './models/RegisterModel.dart';
import './config.dart';

class APIService {
  static var client = http.Client();

  static Future<List<RegisterModel>?> getUser() async{
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json'
    };
    var url = Uri.http(Config.apiURL, Config.registerURL);

    var response = await client.get(url, headers : requestHeaders);

    if (response.statusCode == 200){
      var data = jsonDecode(response.body);

      return registerFromJson(data["data"]);
    }
    else{
      return null;
    }
  }

  static Future<bool> saveUser(
    RegisterModel model,
  ) async{

    var registerUrl = Config.registerURL;
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json'
    };
    var url = Uri.http(Config.apiURL, Config.registerURL);

    var response = await client.get(url, headers : requestHeaders);

    if (response.statusCode == 200){
      var data = jsonDecode(response.body);

      return registerFromJson(data["data"]);
    }
    else{
      return null;
    }
  }
}