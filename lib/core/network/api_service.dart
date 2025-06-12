import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../data/models/movie_model.dart';

class ApiService {
  static const String accessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0MDA5OWFkYjEyNmM2ZmEwMTE2N2MzNGQ0ZDFjNDQ2OCIsIm5iZiI6MTc0OTY5MzU2MC4yNjQ5OTk5LCJzdWIiOiI2ODRhMzQ3OGYwNGFhYWZiNzgzZmQ4MTYiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.bkJz3U-dBxGGCKnyQF1tBaAOgtElOBMGKn7_JYAcZ6Y';
  static const String baseUrl = 'https://api.themoviedb.org/3';

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
