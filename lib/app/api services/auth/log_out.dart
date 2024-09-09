import 'dart:convert';

import 'package:amin_agent/app/api%20services/api_services.dart';
import 'package:amin_agent/app/app%20info/app.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future logOutRequest(headerWithToken) async {
  final uri = ApiServices.logOutUrl;
  final url = Uri.parse(uri);
  final response = await http.post(url, headers: headerWithToken);
  final decodedResponse = jsonDecode(response.body);
  if (response.statusCode == 200 && decodedResponse['success'] == true) {
    return decodedResponse;
  }
  return decodedResponse;
}

Future<int> logoutRequest() async {
  print("pressed2");
  final response = await http
      .post(Uri.parse('http://10.0.2.2:8000/api/market-agent-logout/'));
  print(response.statusCode);
  if (response.statusCode == 200) {
    return response.statusCode;
    print('Logout successful');
  } else {
    return response.statusCode;
    print('Logout failed');
  }
}