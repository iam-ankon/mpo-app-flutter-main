import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../model/assigned_doctors.dart';

Future<List<AssignedDoctors>> fetchAssignedDoctorData() async {
  final response = await http.get(
    Uri.parse('http://10.0.2.2:8000/assigned-doctors/Assigned_doctorsDetailView/')
  );

  if (response.statusCode == 200) {
    List<dynamic> body = jsonDecode(response.body);
    List<AssignedDoctors> assignedDocs = body.map((dynamic item) => AssignedDoctors.fromJson(item)).toList();
    return assignedDocs;
  } else {
    throw Exception('Failed to load assigned doctors');
  }
}

