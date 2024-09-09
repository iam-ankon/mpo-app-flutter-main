import 'package:http/http.dart' as http;

Future<String> fetchCsrfToken() async {
  final response = await http.get(Uri.parse('http://10.0.2.2:8000/'));
  print(response.headers);
  if (response.statusCode != 200) {
    // Extract cookies from response headers
    final cookies = response.headers['set-cookie'];
    print('Cookies: $cookies');

    // Extract the CSRF token from cookies (you may need to parse it based on the format)
    final csrfToken = extractCsrfTokenFromCookies(cookies!);
    print('CSRF Token: $csrfToken');

    return csrfToken;
  } else {
    print('Failed to fetch CSRF token');
  }
  return "";
}

String extractCsrfTokenFromCookies(String cookies) {
  // This function should parse cookies to extract CSRF token.
  // The exact implementation will depend on the cookie format sent by Django.
  final csrfTokenPattern = RegExp(r'csrftoken=([^;]+)');
  final match = csrfTokenPattern.firstMatch(cookies);
  return match?.group(1) ?? '';
}