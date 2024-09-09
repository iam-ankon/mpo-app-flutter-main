
import 'package:amin_agent/app/data/const/export.dart';

import '../../../widgets/appbar.dart';
import '../components/profile_details_card.dart';
import '../components/profile_details_with_upload_card.dart';

class ProfileDetailsScreen extends StatefulWidget {
  final phoneNmber;
  final firstName;
  final lastName;
  final bio;
  final profilePic;

  ProfileDetailsScreen({
    super.key,
    required this.phoneNmber,
    required this.firstName,
    required this.lastName,
    required this.bio,
    required this.profilePic,
  });

  @override
  State<ProfileDetailsScreen> createState() => _ProfileDetailsScreenState();
}

class _ProfileDetailsScreenState extends State<ProfileDetailsScreen> {
  final controller = Get.put(ProfileScreenController());

  @override
  Widget build(BuildContext context) {
    // print('ProfileDetailsScreen');
    print(widget.phoneNmber + "asdf");
    return Scaffold(
      backgroundColor: AppColor.kScaffoldWhite,
      appBar: buildNavigateAppbar('Profile'),
      body: SizedBox(
        width: Get.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              UserAvatar('http://10.0.2.2:8000/${widget.profilePic}'),
              ProfileDetailsCard(
                  label: 'Name',
                  name: '${widget.firstName ?? ""} ${widget.firstName ?? ""}'),
              ProfileDetailsCard(
                  label: 'Phone Number', name: '${widget.phoneNmber ?? ""}'),
              ProfileDetailsCard(
                  label: 'Designation', name: '${widget.bio ?? ""}'),
              const ProfileDetailsCard(
                  label: 'Company', name: 'Amin Diagnostic'),
              ProfileDetailsCardWithUpload(
                  showTap: () {},
                  uploadTap: () {},
                  label: 'NID Card',
                  name: '${controller.userProfileList['nid']}'),
              // ProfileDetailsCard(
              //     label: 'Passport Card',
              //     name: '${controller.userProfileList['passport']}'),
              ProfileDetailsCard(
                  label: 'Address',
                  name: '${controller.userProfileList['address']}'),
              const SizedBox(height: 30)
            ],
          ),
        ),
      ),
    );
  }
}