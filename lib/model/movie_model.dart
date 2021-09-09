part of 'model.dart';

class Movie {
  int id;
  String title;
  double voteAverage;
  double popularity;
  String overview;
  String releaseDate;
  String posterPath;
  String backdropPath;

  Movie(
      {this.id,
      this.title,
      this.voteAverage,
      this.popularity,
      this.overview,
      this.releaseDate,
      this.posterPath,
      this.backdropPath});

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
      id: json['id'],
      title: json['title'],
      voteAverage: (json['vote_average'] as num).toDouble(),
      popularity: (json['popularity'] as num).toDouble(),
      overview: json['overview'],
      releaseDate: json['release_date'],
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path']);

  List<Object> get props => [
        id,
        title,
        voteAverage,
        popularity,
        overview,
        releaseDate,
        posterPath,
        backdropPath
      ];
}
