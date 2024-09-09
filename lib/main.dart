import 'package:amin_agent/app/modules/view%20screen/assigned_doctors/assigned_doctors.dart';
import 'package:amin_agent/app/modules/view%20screen/dashboard%20screen/views/dashboard_screen_view.dart';
import 'package:amin_agent/app/modules/view%20screen/schedule%20screen/views/schedule_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'app/app info/app.dart';
import 'app/modules/view screen/assigned_doctors/doctor_list_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(
      //    DevicePreview(
      //   enabled: !kReleaseMode,
      //   builder: (context) => const AminAgent(), // Wrap your app
      // ),
      // AminAgent());
    GetMaterialApp(
      home: ScheduleScreenView(),
     ));
}
