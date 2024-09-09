import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../model/agent_task.dart';


Future<AgentTask> fetchTaskReport() async {
  final response = await http.get(Uri.parse('http://10.0.2.2:8000/public-api/agent-tasks/agent-tasks/'));

  if (response.statusCode == 200) {
    return AgentTask.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load task report');
  }
}
