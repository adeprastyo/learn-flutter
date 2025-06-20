import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../data/models/user.dart';

class UserService {
  static Future<User?> fetchUserProfile() async {
    final response = await http.get(Uri.parse("http://localhost:3000/profile"));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return User.fromJson(data);
    } else {
      return null;
    }
  }
}
