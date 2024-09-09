
import 'dart:convert';

import 'package:amin_agent/app/modules/view%20screen/profile%20screen/views/profile_details_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../api services/api_services.dart';
import '../../../../data/const/export.dart';
import '../../../../data/dummy data/profile_picture_dummy_data.dart';
import 'package:http/http.dart' as http;

import '../../../../model/user_profile_model.dart';

// class ProfileScreenView extends GetView<ProfileScreenController> {
class ProfileScreenView extends StatefulWidget {
  ProfileScreenView({Key? key}) : super(key: key);

  @override
  State<ProfileScreenView> createState() => _ProfileScreenViewState();
}

class _ProfileScreenViewState extends State<ProfileScreenView> {
  var userProfileData;
  User? user;
  bool isLoading = true;
  Future userProfileRequest(headerWithToken) async {
    // print("qwer1");
    try {
      final uri = ApiServices.userProfileUrl;
      final url = Uri.parse(uri);
      final response = await http.get(url, headers: {
        'Authorization': 'Token 376376cd20fc73a01bd31e8f565d4a78216f4986',
        'Content-Type': 'application/json'
      });
      // print(response.body);
      final decodedResponse = jsonDecode(response.body);
      user = User.fromJson(decodedResponse['user']);

      // print(decodedResponse);
      if (response.statusCode == 200 && decodedResponse['success'] == true) {
        setState(() {
          isLoading = false;
        });
        userProfileData = decodedResponse;
        return decodedResponse; 
      } else {
        setState(() {
          isLoading = false;
        });
      }
      return decodedResponse;
    } catch (e) {}
  }

  @override
  void initState() {
    userProfileRequest("6e1c608f60e85f62c95996ba01c072470f9f97b8");
    super.initState();
  }

  // @override
  // final controller = Get.put(ProfileScreenController());

  @override
  Widget build(BuildContext context) {
    userProfileRequest("6e1c608f60e85f62c95996ba01c072470f9f97b8");
    // print('ProfileScreenView');
    // print(user!.phoneNumber + "asdfg");
    if (isLoading) {
      return const Scaffold(
        backgroundColor: AppColor.kWhiteColor,
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
        backgroundColor: AppColor.kWhiteColor,
        body: Stack(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: ProfileBackgroundView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 10.h),
                    ProfileText(AppString.profile),
                    const SizedBox(height: 10),
                    AvatarUpload(
                      user: user,
                      profilePicUrl: user!.profilePic,
                    ),
                    UserName('${user!.username}'),
                    SalesExecutiveText('${user!.bio}'),
                    const SizedBox(height: 10),
                    VisitAndTargetCard(
                      visit: AppString.visitDone,
                      visitCount: AppString.visitCount,
                      target: AppString.targetComplete,
                      targetCount: AppString.visitCount,
                    ),
                    ProfilePictureGridBuilder(
                      list: pictureDummyData,
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 40,
              right: 20,
              child: CircleAvatar(
                backgroundColor: AppColor.kWhiteColor,
                child: IconButton(
                  onPressed: () {
                    Get.to(() => UserProfileEditScreen(
                          user: user,
                        ));
                  },
                  icon: const Icon(
                    Icons.mode_edit_outline,
                    color: AppColor.kPrimaryColor,
                  ),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: CustomFloatingButton(
          image: AppImages.filterSvg,
          onTap: () {
            print(user!.phoneNumber + "asdfgh");
            Get.to(() => ProfileDetailsScreen(
                  firstName: user!.firstName ??"First Name",
                  lastName: user!.lastName??"Last Name",
                  bio: user!.bio ,
                  phoneNmber: user!.phoneNumber,
                  profilePic: user!.profilePic,
                ));
          },
        ));
  }
}
