import 'dart:convert';

import 'package:get/get.dart';

import '../../../../api services/api_services.dart';
import '../../../../api services/task/daily_task_api.dart';
import '../../../../model/assigned_doctors.dart';

import 'package:http/http.dart' as http;

import '../../../../model/daily_task_model.dart';
class ScheduleScreenController extends GetxController {
  //  Future getTask() async{fetchTasks().then((loadedTasks) {
  //   return loadedTasks;
  // });}
  Future<List<DailyTask>> fetchTaskData() async {
  final response = await http.get(Uri.parse(ApiServices.dailyTasks));

  if (response.statusCode == 200) {
    List<dynamic> body = jsonDecode(response.body);
    List<DailyTask> tasks = body.map((dynamic item) => DailyTask.fromJson(item)).toList();
    // print(body);
    return tasks;
  } else {
    throw Exception('Failed to load tasks');
  }
   
}
   
}
