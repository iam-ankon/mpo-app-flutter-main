

class User {
  final int id;
  final String password;
  final String? lastLogin;
  final bool isSuperuser;
  final bool isStaff;
  final bool isActive;
  final String dateJoined;
  final String username;
  final String? firstName;
  final String? lastName;
  final String? createdAt;
  final String? companyName;
  final String? nidPic;
  final String email;
  final String bio;
  final String profilePic;
  final String phoneNumber;
  final bool isSuperAdmin;
  final bool isMarketAdmin;
  final bool isMarketAgent;
  final bool isDoctor;
  final String? createdBy;

  User({
    required this.id,
    required this.password,
    this.lastLogin,
    required this.isSuperuser,
    required this.isStaff,
    required this.isActive,
    required this.dateJoined,
    required this.username,
    this.firstName,
    this.lastName,
    this.createdAt,
    this.companyName,
    this.nidPic,
    required this.email,
    required this.bio,
    required this.profilePic,
    required this.phoneNumber,
    required this.isSuperAdmin,
    required this.isMarketAdmin,
    required this.isMarketAgent,
    required this.isDoctor,
    this.createdBy,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      password: json['password'],
      lastLogin: json['last_login'],
      isSuperuser: json['is_superuser'],
      isStaff: json['is_staff'],
      isActive: json['is_active'],
      dateJoined: json['date_joined'],
      username: json['username'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      createdAt: json['created_at'],
      companyName: json['company_name'],
      nidPic: json['nid_pic'],
      email: json['email'],
      bio: json['bio'],
      profilePic: json['profile_pic'],
      phoneNumber: json['phone_number'],
      isSuperAdmin: json['is_super_admin'],
      isMarketAdmin: json['is_market_admin'],
      isMarketAgent: json['is_market_agent'],
      isDoctor: json['is_doctor'],
      createdBy: json['created_by'],
    );
  }
}
