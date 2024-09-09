class ApiServices {
  static const String _baseUrl = 'http://10.0.2.2:8000/';
  static const String _route = 'public-api/';
  static String loginUrl = '$_baseUrl/api/market-agent-login/';
  static String verifyOtpUrl = '$_baseUrl$_route/verify-otp';
  static String logOutUrl = '$_baseUrl$_route/logout';
  static String resendOtpUrl = '$_baseUrl$_route/resend-otp';
  static String forgotPasswordUrl = '$_baseUrl$_route/forgot-password';
  static String resetPasswordUrl = '$_baseUrl$_route/reset-password';
  static String userProfileUrl = '$_baseUrl$_route/me';
  static String resetPassOtpManageUrl =
      '$_baseUrl$_route/reset-password-otp-match';
  static String dashboardData = '$_baseUrl$_route/dashboard-data';
  static String agentTasks = '$_baseUrl$_route/agent-tasks/';
  static String schedule = '$_baseUrl$_route/schedule/';
  static String doctors = '$_baseUrl$_route/doctors/';
  static String assignedDoctors = '$_baseUrl$_route/assigned-doctors/';
  static String dailyTasks = '$_baseUrl/daily-tasks/daily-tasks/';
  ApiServices._();
}

final headers = {'Content-Type': 'application/json'};
