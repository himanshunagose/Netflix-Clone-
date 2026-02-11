class Movie {
  final String id;
  final String title;
  final String description;
  final String posterUrl;
  final String backdropUrl;
  final double rating;
  final String year;
  final String duration;
  final String genre;
  final List<String> cast;
  final String trailerUrl;
  final bool isSeries;

  const Movie({
    required this.id,
    required this.title,
    required this.description,
    required this.posterUrl,
    required this.backdropUrl,
    required this.rating,
    required this.year,
    required this.duration,
    required this.genre,
    required this.cast,
    this.trailerUrl = '',
    this.isSeries = false,
  });
}
