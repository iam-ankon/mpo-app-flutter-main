import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../model/daily_task_model.dart';

Future<List<DailyTask>> fetchTasks() async {
  final response = await http.get(Uri.parse('http://10.0.2.2:8000/public-api/daily-tasks/daily-tasks/'));

  if (response.statusCode == 200) {
    List<dynamic> body = jsonDecode(response.body);
    List<DailyTask> tasks = body.map((dynamic item) => DailyTask.fromJson(item)).toList();
    return tasks;
  } else {
    throw Exception('Failed to load tasks');
  }
}
