import '../../../../data/const/export.dart';

class AvatarUpload extends StatelessWidget {
  final user;
  final String profilePicUrl;
  AvatarUpload({
    super.key,
    this.onTap,
    required this.profilePicUrl,
    required this.user,
  });

  final controller = Get.put(ProfileScreenController());

  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        UserAvatar('http://10.0.2.2:8000/${profilePicUrl}'),
        Positioned(
          bottom: 30,
          right: -0,
          child: InkWell(
            onTap: onTap,
            child: const CircleAvatar(
              backgroundColor: AppColor.kSecondaryColor,
              radius: 20,
              child: IconButton(
                icon: Icon(
                  Icons.camera_alt,
                  color: AppColor.kWhiteColor,
                  size: 25,
                ),
                onPressed: addPhotoDialog,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
