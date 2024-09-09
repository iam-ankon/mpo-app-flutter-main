
import 'package:amin_agent/app/api%20services/auth/login.dart';
import 'package:amin_agent/app/data/const/export.dart';

class LoginScreenController extends GetxController {
  final number = TextEditingController();
  final password = TextEditingController();
  final otp = TextEditingController();
  final numberFocus = FocusNode();
  final passFocus = FocusNode();
  final RxBool _isSecure = true.obs;
  bool _isProgress = false;
  final formKey = GlobalKey<FormState>();

  bool get isSecure => _isSecure.value;
  bool get isProgress => _isProgress;

  void isSecureChange() {
    _isSecure.value = !_isSecure.value;
  }

  Future login(context) async {
    final response = await loginRequest(number.text, password.text);
    // print(response);
    if (response['detail'] == 'Login successful.') {
      await StoreData.saveId(response['user']['id'].toString());
      await StoreData.saveToken(response['user']['token']);
      AwesomeDialogs.showSuccessDialog(context, desc: 'Log in successfully');
      Get.offAllNamed(RouteName.bottomNav);
      print("running2");
      print(response);
      // Navigator.of(context)
      //     .push(MaterialPageRoute(builder: (context) => BottomNav()));
      // Get.toNamed(RouteName.dashboardScreen);
      // Get.toNamed(RouteName.otpVerifyScreen,
      //     arguments: {'id': '${response['data']['user_id']}'});
    }
    //  else if (response['message'] == 'Validation error.') {
    //   AwesomeDialogs.showErrorDialog(context,
    //       desc: response['data']['phone'][0]);
    // } else if (response['success'] == false) {
    //   AwesomeDialogs.showErrorDialog(context, desc: response['message']);
    // } else if (response['message'] == 'Invalid password.') {
    //   AwesomeDialogs.showErrorDialog(context, desc: response['message']);
    // } else if (response['message'] == 'The password field must not be greater than 32 characters.') {
    //   AwesomeDialogs.showErrorDialog(context, desc: response['message']);
    // }else if (response['message'] == 'The password field must be at least 6 characters.') {
    //   AwesomeDialogs.showErrorDialog(context, desc: response['message']);
    // }
    else {
      // AwesomeDialogs.showErrorDialog(context,
      //     desc: response['data']['password'][0]);
    }
  }

  Future<void> loginInitializeMethod(context) async {
    _isProgress = true;
    update();
    try {
      await Future.wait([
        login(context),
      ]);
    } catch (e) {
      throw Exception('$e');
    } finally {
      _isProgress = false;
      update();
    }
  }

  void validateMethod(context) {
    passFocus.unfocus();
    if (formKey.currentState!.validate()) {
      loginInitializeMethod(context);
    }
  }

  void submitNumber(v) {
    numberFocus.requestFocus(passFocus);
  }

  @override
  void dispose() {
    number.dispose();
    password.dispose();
    otp.dispose();
    passFocus.unfocus();
    numberFocus.dispose();
    super.dispose();
  }
}
