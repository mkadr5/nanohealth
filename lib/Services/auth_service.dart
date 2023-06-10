import 'package:http/http.dart' as http;

class AuthService {
  Future<String> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('https://fakestoreapi.com/auth/login'),
      body: {'username': username, 'password': password},
    );
    print("response : ${response.body}");
    if (response.statusCode == 200) {
      final token = response.body;
      return token;
    } else {
      throw Exception('Failed to log in');
    }
  }
}
