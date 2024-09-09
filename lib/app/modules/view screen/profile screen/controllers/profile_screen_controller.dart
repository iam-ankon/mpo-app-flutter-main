import 'dart:io';

import 'package:amin_agent/app/data/const/export.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../api services/auth/user_profile.dart';
import '../../../../data/utils/user_data_key.dart';
import 'package:http/http.dart' as http;

class ProfileScreenController extends GetxController {
  int selectedIndex = 0;
  final RxBool _isProgress = false.obs;
  bool get isProgress => _isProgress.value;
  Map<String, dynamic> _userProfileList = {}; // Specify the type of the map
  Map<String, dynamic> get userProfileList => _userProfileList;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController designationController = TextEditingController();
  final TextEditingController companyController = TextEditingController();
  final TextEditingController nidController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  var profileImage;
  var nidImage;

  void increment() {
    selectedIndex = 1;
    update();
  }

  void decrement() {
    selectedIndex = 0;
    update();
  }

  double progress = 0.0;

  void updateValue(v) {
    print('updateValue');
    progress = v;
    update();
  }

  Future userProfile() async {
    // print('userProfile');
    final token = await box.read(UserDataKey.tokenKey);
    print(token);
    final headerWithToken = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    if (token != null) {
      final response = await userProfileRequest(headerWithToken);
      print(response);
      if (response['success'] == true) {
        _userProfileList = response['data']['user'];
        nameController.text = '${userProfileList['name']}';
        numberController.text = '${userProfileList['phone']}';
        designationController.text = '${userProfileList['designation']}';
        companyController.text = 'Amin Diagnostic';
        nidController.text = '${userProfileList['nid']}';
        addressController.text = ' ${userProfileList['address']}';
      }
    }
  }

//
  Future<void> userProfileInitializeMethod() async {
    print('userProfileInitializeMethod');
    try {
      print("qwer1");
      await Future.wait([
        userProfile(),
      ]);
    } catch (e) {
      throw Exception('$e');
    } finally {
      _isProgress.value = false;
    }
  }

  Future<void> uploadImage(
      File imageFile, String token, String phoneNumber) async {
    var request = http.MultipartRequest(
      'PUT',
      Uri.parse(
          'http://10.0.2.2:8000/api/update-user/'), // Update with your endpoint
    );

    request.headers['Authorization'] =
        'Token $token'; // Add token in header for authentication
    request.files.add(await http.MultipartFile.fromPath(
        'profile_pic', // or 'nid_pic' depending on which image you're uploading
        imageFile.path,
        filename: '$phoneNumber.jpg' //basename(imageFile.path),
        ));
    request.fields['first_name'] = 'Sam';
    request.fields['last_name'] = 'Sho';
    request.fields['phone_number'] = '01748320648';
    request.fields['bio'] = 'Doe';
    request.files.add(await http.MultipartFile.fromPath(
        'nid_pic', // or 'nid_pic' depending on which image you're uploading
        imageFile.path,
        filename: '$phoneNumber.jpg' //basename(imageFile.path),
        ));

    var response = await request.send();
    if (response.statusCode == 200) {
      print("Image uploaded successfully");
    } else {
      print("Image upload failed: ${response.statusCode}");
    }
  }

  Future pickImage(ImageSource imageSource, String phoneNumber) async {
    try {
      final image = await ImagePicker().pickImage(source: imageSource);
      if (image == null) return;
      profileImage = File(image.path);
      await uploadImage(profileImage,
          '376376cd20fc73a01bd31e8f565d4a78216f4986', phoneNumber);
// setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  void onInit() {
    print("ProfileScreenController");

    userProfileInitializeMethod();
    super.onInit();
  }
}


