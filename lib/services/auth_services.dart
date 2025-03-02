import 'package:http/http.dart' as http;
import 'package:inventory_app/models/response_login.dart';

const baseUrl = 'http://192.168.1.112:8888/server_inventory/index.php/api/';

class AuthServices {
  Future<ResponseLogin> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('${baseUrl}login'),
      body: {
        'email': email,
        'password': password,
      },
    );
    if (response.statusCode == 200) {
      return responseLoginFromJson(response.body);
    } else {
      throw Exception('Failed to login');
    }
  }
}
