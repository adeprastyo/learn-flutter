class MovieModel {
  final int id;
  final String title;
  final String posterPath;

  // Default constructor
  MovieModel({
    required this.id,
    required this.title,
    required this.posterPath,
  });

  // Factory constructor
  factory MovieModel.yahaha(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      title: json['title'],
      posterPath: json['poster_path'] ?? '',
    );
  }
}
