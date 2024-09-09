import 'dart:convert';

import 'package:amin_agent/app/modules/widgets/appbar.dart';
import 'package:amin_agent/app/modules/view%20screen/user%20profile%20edit%20screen/components/drawer_update_card.dart';
import 'package:amin_agent/app/modules/widgets/primary_button.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../data/const/export.dart';
import 'package:http/http.dart' as http;

class UserProfileEditScreen extends StatelessWidget {
  final user;
  UserProfileEditScreen({super.key, required this.user});

  final profileController = Get.put(ProfileScreenController());
  final dashboardController = Get.put(DashboardScreenController());

  @override
  Widget build(BuildContext context) {
    Future<void> updateUser({
      required String token,
      required String firstName,
      required String lastName,
      required String email,
      required String phoneNumber,
      required String bio,
      // required var nidPic,
    }) async {
      // Define the API URL (make sure to replace with your own endpoint)
      const String apiUrl = 'http://10.0.2.2:8000/api/update-user/';

      // Create a header with the token for authentication
      final Map<String, String> headers = {
        'Authorization':
            'Token $token', // Ensure the correct token type ('Token' or 'Bearer')
      };

      // Create the data to be sent
      var request = http.MultipartRequest('PUT', Uri.parse(apiUrl))
        ..headers.addAll(headers)
        ..fields['first_name'] = firstName
        ..fields['last_name'] = lastName
        ..fields['email'] = email
        ..fields['phone_number'] = phoneNumber
        ..fields['bio'] = bio;
// if (nidPic != null) {
//     request.files.add(await http.MultipartFile.fromPath(
//       'nid_pic',
//       nidPic.path,
//       contentType: MediaType('image', 'jpeg'), // Adjust content type as needed
//     ));
//   }

//   if (profilePic != null) {
//     request.files.add(await http.MultipartFile.fromPath(
//       'profile_pic',
//       profilePic.path,
//       contentType: MediaType('image', 'jpeg'), // Adjust content type as needed
//     ));
//   }

      try {
        // Send the multipart request
        final http.StreamedResponse response = await request.send();
        final responseBody = await response.stream.bytesToString();

        // Check if the request was successful
        if (response.statusCode == 200) {
          final Map<String, dynamic> responseData = jsonDecode(responseBody);
          print('User updated successfully: ${responseData['user']}');
        } else {
          print('Failed to update user. Status code: ${response.statusCode}');
          print('Response: $responseBody');
        }
      } catch (e) {
        print('An error occurred: $e');
      }
    }

    return Scaffold(
      backgroundColor: AppColor.kScaffoldWhite,
      appBar: buildNavigateAppbar('Profile Edit'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // UserAvatar('${profileController.userProfileList['avatar']}'),
          Expanded(
            child: ListView(
              children: [
                const SizedBox(height: 10),
                DrawerUpdateCard(
                    controller: profileController.nameController,
                    label: 'Name'),
                DrawerUpdateCard(
                    controller: profileController.numberController,
                    label: 'Phone Number'),
                DrawerUpdateCard(
                    controller: profileController.designationController,
                    label: 'Designation'),
                DrawerUpdateCard(
                    controller: profileController.companyController,
                    label: 'Company'),
                DrawerUpdateCard(
                    controller: profileController.nidController,
                    label: 'Email'),

                InkWell(
                  onTap: () {
                    profileController.pickImage(
                        ImageSource.gallery, "nid_pic_test");
                  },
                  child: Text("Nid upload"),
                  // child: DrawerUpdateCard(
                  //     controller: profileController.nidController,
                  //     label: 'NID Number'),
                ),
                // DrawerUpdateCard(
                //     controller: profileController.addressController,
                //     label: 'Location'),
                const SizedBox(height: 30),
              ],
            ),
          ),
          SecondaryButton(
            text: 'Update',
            onTap: () {
              updateUser(
                token: '376376cd20fc73a01bd31e8f565d4a78216f4986',
                firstName: profileController.nameController.text,
                lastName: profileController.nameController.text,
                email: profileController.nidController.text == ""
                    ? user.email
                    : profileController.nidController.text,
                phoneNumber: profileController.numberController.text == ""
                    ? user.phoneNumber
                    : profileController.numberController.text,
                bio: profileController.designationController.text,
                // nidPic: profileController.nidController.text,
              );
            },
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}