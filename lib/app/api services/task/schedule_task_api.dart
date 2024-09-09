import 'dart:convert';
import 'package:http/http.dart' as http;


import '../../model/schedule.dart';
 // Import your model

Future<List<Schedule>> fetchTasks() async {
  final response = await http.get(Uri.parse('http://10.0.2.2:8000/public-api/schedule/schedule/'));

  if (response.statusCode == 200) {
    List<dynamic> taskListJson = jsonDecode(response.body);
    return taskListJson.map((json) => Schedule.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load tasks');
  }
}
