// import 'dart:convert';

// import 'package:get/get.dart';

// import 'package:http/http.dart' as http;

// import '../../../../api services/api_services.dart';
// import '../../../../model/assigned_doctors.dart';

// class ScheduleScreenController extends GetxController {
//    Future<List<AssignedDoctors>> fetchTaskData() async {
//   final response = await http.get(Uri.parse(ApiServices.dailyTasks));

//   if (response.statusCode == 200) {
//     List<dynamic> body = jsonDecode(response.body);
//     List<AssignedDoctors> tasks = body.map((dynamic item) => AssignedDoctors.fromJson(item)).toList();
//     print(body);
//     return tasks;
//   } else {
//     throw Exception('Failed to load tasks');
//   }
   
// }