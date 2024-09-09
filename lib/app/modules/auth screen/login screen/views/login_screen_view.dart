
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../data/const/export.dart';

class LoginScreenView extends GetView<LoginScreenController> {
  LoginScreenView({super.key});

  final LoginScreenController _controller = Get.put(LoginScreenController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PrimaryBackgroundView(
            child: SingleChildScrollView(
          child: Form(
            key: _controller.formKey,
            child: Column(
              children: [
                SizedBox(height: 15.h),
                BigText(text: AppString.welcome),
                LoginToContinueText(AppString.loginToContinue),
                SizedBox(height: 5.h),
                CustomTextField(
                  onEditingComplete: () {
                    FocusScope.of(context).requestFocus(controller.passFocus);
                  },
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  focusNode: _controller.numberFocus,
                  validator: validateMobile,
                  controller: _controller.number,
                  hintText: AppString.phone,
                  // hintText: "Username",

                  img: AppImages.textFieldPhone,
                ),
                Obx(
                  () => CustomTextField(
                    keyboardType: TextInputType.text,
                    onEditingComplete: () {
                      _controller.validateMethod(context);
                    },
                    textInputAction: TextInputAction.done,
                    focusNode: _controller.passFocus,
                    obscureText: _controller.isSecure,
                    validator: validatePassword,
                    controller: _controller.password,
                    hintText: AppString.password,
                    img: AppImages.textFieldPass,
                    icon: IconButton(
                      onPressed: _controller.isSecureChange,
                      icon: Icon(
                        _controller.isSecure
                            ? Icons.remove_red_eye_sharp
                            : Icons.remove_red_eye_outlined,
                        color: AppColor.kWhiteColor,
                        size: 30,
                      ),
                    ),
                  ),
                ),
                ForgetButton(
                  text: AppString.forgetPassword,
                  onPressed: () {
                    Get.toNamed(RouteName.forgetPasswordScreen);
                  },
                ),
                SizedBox(height: 10.h),
                GetBuilder<LoginScreenController>(
                  builder: (_) => LoginButton(
                    isProgress: _controller.isProgress,
                    text: AppString.login,
                    onTap: () async {
                      _controller.validateMethod(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}