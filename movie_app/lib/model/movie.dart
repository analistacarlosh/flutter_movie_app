
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/model/genre.dart';
part 'movie.g.dart';

@JsonSerializable(nullable: false)
class Movie {

  Movie({
    this.name,
    this.posterImageUrl,
    this.genresId,
    this.releaseDate,
    this.overview,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  @JsonKey(name: 'title', includeIfNull: false)
  final String name;
  @JsonKey(name: 'poster_path')
  final String posterImageUrl;
  @JsonKey(name: 'genre_ids')
  final List<int> genresId;
  @JsonKey(name: 'release_date')
  final String releaseDate;
  @JsonKey(name: 'overview')
  final String overview;
  @JsonKey(ignore: true)
  List<Genre> genres;

  @override
  String toString() {
    return 'name: $name, posterImageUrl: $posterImageUrl, genders: ${genresId
        .toString()}, release: $releaseDate, overview: $overview';
  }

  Map<String, dynamic> toJson() => _$MovieToJson(this);

}