import 'dart:convert';

import 'package:amin_agent/app/api%20services/api_services.dart';
import 'package:bottom_bar_matu/utils/app_utils.dart';
import 'package:http/http.dart' as http;

// import 'fetch_csrf.dart';

Future loginRequest(number, password) async {
  final uri = ApiServices.loginUrl;
  final url = Uri.parse(uri);
  final body = jsonEncode({"phone_number": number, "password": password});

  final response = await http.post(url, body: body, headers: headers);

  final decodedResponse = jsonDecode(response.body);
  // print(decodedResponse);
  if (response.statusCode == 200 && decodedResponse['success'] == true) {
    return decodedResponse;
  }
  return decodedResponse;
}

// Future<int> postData(String number, String password) async {
//   print("running3");
//   final response = await http.post(
//     Uri.parse(ApiServices.loginUrl),
//     headers: {
//       'Content-Type': 'application/json',
//     },
//     body: jsonEncode(
//         {"phone": number, "password": password}), // Your request body
//   );

//   print(response.body);
//   if (response.statusCode == 200) {
//     return response.statusCode;
//   } else {
//     return response.statusCode;
//   }
// }
