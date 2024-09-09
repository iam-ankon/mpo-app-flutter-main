import 'dart:convert';

import 'package:amin_agent/app/api%20services/api_services.dart';
import 'package:http/http.dart' as http;

Future dashboardData(headerWithToken) async {
  final uri = ApiServices.dashboardData;
  final url = Uri.parse(uri);
  final response = await http.get(url, headers: headerWithToken);
  final decodedResponse = jsonDecode(response.body);
  if (response.statusCode == 200 && decodedResponse['success'] == true) {
    print(decodedResponse);
    return decodedResponse;
  }
  print(decodedResponse);
  print(response.statusCode.toString() + "errorcode");

  return decodedResponse;
}
