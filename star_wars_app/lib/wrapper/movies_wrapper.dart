import 'package:star_wars_app/model/movie.dart';

class MoviesWrapper {
  final int count;
  final int next;
  final int previous;
  final List<Movie> moviesResults;

  // Default constructor
  MoviesWrapper({this.count, this.next, this.previous, this.moviesResults});

  // Method that supports the factory pattern.
  factory MoviesWrapper.fromJson(Map<String, dynamic> json) {
    var list = json['results'] as List;

    List<Movie> moviesList = list.map((item) => Movie.fromJson(item)).toList();

    return MoviesWrapper(
        count: json['count'],
        next: json['next'],
        previous: json['previous'],
        moviesResults: moviesList);
  }
}
