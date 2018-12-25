class Movie {
  final String title;
  final String openingCrawl;
  final String director;
  final String producer;
  final String releaseDate;
  final int episodeId;

  // Default constructor
  Movie(
      {this.title,
      this.openingCrawl,
      this.director,
      this.producer,
      this.releaseDate,
      this.episodeId});

  // Method that supports the factory pattern.
  // The method return a movie instance
  // Dynamic represents any kind of object
  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        title: json['title'],
        openingCrawl: json['opening_crawl'],
        director: json['director'],
        producer: json['producer'],
        releaseDate: json['release_date'],
        episodeId: json['episode_id']);
  }
}
