import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../model/doctors.dart';

Future<List<Doctors>> fetchDoctors() async {
  final response = await http.get(Uri.parse('http://127.0.0.1:8000/sale-records'));

  if (response.statusCode == 200) {
    List<dynamic> body = jsonDecode(response.body);
    List<Doctors> doctors = body.map((dynamic item) => Doctors.fromJson(item)).toList();
    return doctors;
  } else {
    throw Exception('Failed to load sale records');
  }
}
