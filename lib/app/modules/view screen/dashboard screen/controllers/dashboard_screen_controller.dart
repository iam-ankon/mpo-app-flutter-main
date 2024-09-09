import 'package:amin_agent/app/api%20services/dashboard/dashboad_api.dart';
import 'package:get/get.dart';

import '../../../../api services/auth/log_out.dart';
import '../../../../data/utils/store_data.dart';
import '../../../../data/utils/user_data_key.dart';
import '../../../../routes/app_pages.dart';

class DashboardScreenController extends GetxController {
  String text = 'Total commission';

  Future logout() async {
    final token = await box.read(UserDataKey.tokenKey);
    final headerWithToken = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token', // Corrected header for Bearer token
    };
    final response = await logOutRequest(headerWithToken);
    if (response['success'] == true) {
      box.erase();
      Get.offAllNamed(RouteName.loginScreen);
    } else {
      box.erase();
      Get.offAllNamed(RouteName.loginScreen);
    }
  }

  Future dashboard() async {
    final token = await box.read(UserDataKey.tokenKey);
    final headerWithToken = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token', // Corrected header for Bearer token
    };
    final response = await dashboardData(headerWithToken);
    if (response['success'] == true) {
      box.erase();
      print(response.data);
      print("1");
      // Get.offAllNamed(RouteName.loginScreen);
    } else {
      print(response.data);

      box.erase();
      print("1");

      // Get.offAllNamed(RouteName.loginScreen);
    }
  }
}
