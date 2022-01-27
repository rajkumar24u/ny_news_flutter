import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:http/http.dart';
import 'package:flutter/foundation.dart' as Foundation;

const _timeoutDuration = Duration(seconds: 35);

class HTTP {


  static get({required String api, success: (dynamic), failure: (String)}) async {

    try {
      Map<String, String>  headers = {
        "Content-Type": "application/json",
        "Accept": "application/json",
      };
      final apiUrl = Uri.parse(api);
      Response response = await http.get(apiUrl, headers: headers).timeout(_timeoutDuration);

      final body = _bodyFromResponse(response: response);
      success(body);
    } on TimeoutException catch(_) {
      failure("Unable to connect to the server");
    } catch (error) {
      final body = (Foundation.kDebugMode) ? error.toString() : null;
      failure(body);
    }

  }



  static dynamic _bodyFromResponse({required Response response}) {

    int statusCode = response.statusCode;
    final jsonResponse = convert.jsonDecode(response.body);
    try {
      if(statusCode == HttpStatus.ok) {
        return jsonResponse;
      } else if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
        var jsonResponse = convert.jsonDecode(response.body);
        String body;
        body = "Something Went Wrong";
        body = jsonResponse["fault"]["faultstring"] as String;
        return body;
      } else {
        return "Something Went Wrong";
      }
    } catch (error) {
      final body = (Foundation.kDebugMode) ? error.toString() : null;
      return body;
    }

  }


}




