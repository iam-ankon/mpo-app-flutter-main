// doctor_model.dart

class Doctor {
  final int id;
  final String username;
  final String firstName;
  final String lastName;
  final String email;
  final String bio;
  final String profilePic;
  final String phoneNumber;
  final String companyName;

  Doctor({
    required this.id,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.bio,
    required this.profilePic,
    required this.phoneNumber,
    required this.companyName,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json['id'],
      username: json['username'],
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      email: json['email'],
      bio: json['bio'] ?? '',
      profilePic: json['profile_pic'],
      phoneNumber: json['phone_number'] ?? '',
      companyName: json['company_name'] ?? '',
    );
  }
}
