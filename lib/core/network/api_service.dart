import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../data/models/movie_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiService {
  final String accessToken = dotenv.env['API_KEY']!;
  final String baseUrl = dotenv.env['BASE_URL']!;

  Future<List<MovieModel>> fetchPopularMovies() async {
    final response = await http.get(
      Uri.parse('$baseUrl/movie/popular'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List results = data['results'];
      return results.map((json) => MovieModel.yahaha(json)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
