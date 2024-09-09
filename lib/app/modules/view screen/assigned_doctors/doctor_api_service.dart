// api_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'doctor_models.dart';

Future<List<Doctor>> fetchDoctorsByIds(List<int> doctorIds) async {
  // Convert the list of doctor IDs to a comma-separated string
  String ids = doctorIds.join(',');

  final response = await http.get(
    Uri.parse('http://10.0.2.2:8000/api/doctors-by-ids/?ids=$ids')// Replace with your actual API URL
    // headers: {
    //   'Authorization': 'Token YOUR_AUTH_TOKEN', // Pass authentication token if required
    // },
  );

  if (response.statusCode == 200) {
    List<dynamic> body = jsonDecode(response.body)['doctors'];
    print(body);
    return body.map((dynamic item) => Doctor.fromJson(item)).toList();
  } else {
    throw Exception('Failed to load doctors');
  }
}
