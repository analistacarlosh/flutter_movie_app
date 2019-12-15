
import 'genre.dart';

class Movie {

  Movie({
    this.name,
    this.posterImageUrl,
    this.genresId,
    this.releaseDate,
    this.overview
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    List<int> genreIds = [];
    for (var position = 0; position < json['genre_ids'].length; position++) {
      genreIds.add(json['genre_ids'][position]);
    }
    
    return Movie(
      name: json['title'],
      posterImageUrl: 'https://image.tmdb.org/t/p/w500${json['poster_path']}',
      genresId: genreIds,
      releaseDate: json['release_date'],
      overview: json['overview'],
    );
  }

  String name;
  String posterImageUrl;
  List<int> genresId;
  List<Genre> genres;
  String releaseDate;
  String overview;

  @override
  String toString() {
    return 'name: $name, posterImageUrl: $posterImageUrl, genders: ${genresId
        .toString()}, release: $releaseDate, overview: $overview';
  }
}